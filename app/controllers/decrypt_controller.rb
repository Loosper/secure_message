require 'openssl'

class DecryptController < ApplicationController
  def create
    message = decrypt params[:message]

    render plain: message
  end

  def decrypt cypher
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

    return msg.join
    # return msg.map {|let| let.to_i.chr}.join
  end
end
