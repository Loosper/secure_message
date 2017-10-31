require('digest')

class SubmitController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def new
  end

  def create
    # TODO: THERE MIGHT BE SLAAHES! ESCAPE THEM
    @path = Digest::SHA1.base64digest(params[:message])
    Message.new(
      text: params[:message],
      link: @path
    ).save

    if request.env['PATH_INFO'] == '/notes/api'
      render plain: request.base_url + '/message/' + @path
    end
  end
end
