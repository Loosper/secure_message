# thanks stackOverflow
class String
    def is_i?
       !!(self =~ /\A[-+]?[0-9]+\z/)
    end
end

class RsaController < ApplicationController
  def new
    id = rand(1..10000).to_s

    if params[:n] and params[:e] and params[:d]
      if not params[:n].is_i? and not params[:e].is_i? and not params[:d].is_i?
        raise ActionController::BadRequest.new(), "Bad params"
      end

      RsaKey.new(
        n: params[:n].to_i,
        e: params[:e].to_i,
        d: params[:d].to_i,
        uid: id
      ).save
    else
      n, e, d = new_key

      RsaKey.new(n: n, e: e, d: d, uid: id).save
    end

    render plain: id
  end

  def show
    keys = RsaKey.find_by(uid: params[:id])

    # REVIEW
    render json: { "n" => keys[:n], "e" => keys[:e], "d" => keys[:d] }
  end

  def egcd(a, b)
    if a == 0
      return b, 0, 1
    else
      g, y, x = egcd(b % a, a)
      return g, x - (b / a) * y, y
    end
  end

  def modinv(a, m)
    g, x, _ = egcd(a, m)
    if g != 1
      raise ArgumenError('modular inverse does not exist')
    else
      return x % m
    end
  end

  def new_key
    # we want them BIG
    p = 2 ^ rand(100..10000000) - 1
    q = 2 ^ rand(1000..10000) - 1
    n = p * q
    tot = (p - 1) * (q - 1)
    e = nil

    # this makes a relaively random number
    (tot - 2).downto(2) do |num|
      if num.gcd(tot) == 1
        e = num
        break
      end
    end

    d = modinv(e, tot)
    return n, e, d
  end
end
