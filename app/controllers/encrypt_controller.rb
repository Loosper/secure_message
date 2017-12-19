require 'openssl'

class EncryptController < ApplicationController
  def create
    cypher = encrypt params[:message]

    render plain: cypher
  end

  def encrypt msg
    key = RsaKey.find_by(uid: params[:id])
    @e = key.e.to_i
    @n = key.n.to_i

    cypher = []
    msg.bytes.each do |byte|
      cypher << byte.to_bn.mod_exp(@e, @n).to_s
      # p byte.to_bn.mod_exp(@e, @n).to_s
      # cypher << (byte ** @e) % @n
    end

    # simple padding until i read up on base64
    Encrypted.new(uid: id, message: cypher.join(' ')).save
    return id

    # return cypher.join(' ')
  end

  def show
    msg = Encrypted.find_by(uid: params[:msg_id]).message

    render plain: msg
  end
end
