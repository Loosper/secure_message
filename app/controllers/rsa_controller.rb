class RsaController < ApplicationController
  def new
    id = rand(1..10000).to_str
    Rsa_key.new(
      params[:n].to_i,
      params[:e].to_i,
      params[:d].to_i,
      id
    ).save

    render plain: id
  end

  def show
    keys = Rsa_key.find_by(id: params[id])

    render plain: [keys[:n], keys[:e], keys[:d]]
  end

  def create
    id = rand(1..10000).to_str
    n, e, d = new_key

    Rsa_key.new(n, e, d, id).save

    render plain: id
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
    p = 2 ^ rand(100..10000000000000) - 1
    q = 2 ^ rand(1000..100000000) - 1
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
