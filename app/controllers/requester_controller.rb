class RequesterController < ApplicationController
   before_filter :authenticate_requester!
   layout 'request_layout'
  def index
  end
  def new
     respond_to do |format|
       format.html
       format.json
     end
  end

end
