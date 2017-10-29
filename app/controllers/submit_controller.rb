require('digest')

class SubmitController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
    @path = Digest::SHA1.base64digest(params[:message])
    Message.new(
      text: params[:message],
      link: @path
    ).save
    # @path = Digest::SHA1.base64digest(params[:message])
  end
end
