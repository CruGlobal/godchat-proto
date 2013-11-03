class Engine::BaseController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action
  layout 'engine'
  def index

  end
  
end