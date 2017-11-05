require('digest')

class SubmitController < ApplicationController
  # skip_before_action :verify_authenticity_token
  def new
  end

  def create
    if is_xml?
      params[:message] = Nokogiri::XML(request.body.read).xpath('//message').text
    end

    # TODO: THERE MIGHT BE SLASHES! ESCAPE THEM
    @path = Digest::SHA1.base64digest(params[:message])
    Message.new(
      text: params[:message],
      link: @path
    ).save

    @response = {'url': request.base_url + '/message/' + @path}

    respond_to do |format|
      if self.is_xml?
        format.xml {render}
      elsif self.is_json?
        format.json {render}
      end
    end
  end

  def is_xml?
    request.content_type.include? 'xml'
  end

  def is_json?
    request.content_type.include? 'json'
  end
end
