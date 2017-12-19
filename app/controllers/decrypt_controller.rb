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

    # p cypher
    cypher.each do |byte|
      msg << byte.to_i.to_bn.mod_exp(@d, @n).to_s
    end

    # p msg
    Decrypted.new(uid: id, message: msg.map {|let| let.to_i.chr}.join).save
    return id
  end

  def show
    msg = Decrypted.find_by(uid: params[:msg_id]).message

    render plain: msg
  end
end
