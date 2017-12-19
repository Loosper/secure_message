require 'openssl'

class DecryptController < ApplicationController
  def create
    message = decrypt params[:message]

    render plain: message
  end

  def decrypt cypher
    id = rand(1..10000).to_s

    key = RsaKey.find_by(uid: params[:id])
    @d = key.d.to_i
    @n = key.n.to_i

    cypher = cypher.split ' '
    msg = []
    cypher.each do |byte|
      # p byte
      # msg << (byte ** @d) % @n
      # this doesn't work
      # i fucked it up somehow?
      msg << byte.to_i.to_bn.mod_exp(@d, @n)
    end

    Decrypted.new(uid: id, message: msg.join).save
    return id
    # return msg.map {|let| let.to_i.chr}.join
  end

  def show
    msg = Decrypted.find_by(uid: params[:msg_id]).message

    render plain: msg
  end
end
