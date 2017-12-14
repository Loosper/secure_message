class DecryptController < ApplicationController
  def create
    message = decrypt params[:message]

    render plain: message
  end

  def decrypt cypher
    key = Rsa_key.find_by(id: params[:id])
    @d = key.d.to_i
    @n = key.n.to_i

    cypher.split ' '
    msg = []
    cypher.each do |byte|
      msg << (byte ** @d) % @n
    end

    return msg.map {|let| let.chr}.join
  end
end
