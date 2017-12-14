class EncryptController < ApplicationController
  def create
    cypher = encrypt params[:message]

    render plain: cypher
  end

  def encrypt msg
    key = Rsa_key.find_by(id: params[:id])
    @e = key.e.to_i
    @n = key.n.to_i

    cypher = []
    msg.bytes.each do |byte|
      cypher << (byte ** @e) % @n
    end

    # simple padding until i read up on base64
    return cypher.join(' ')
  end
end
