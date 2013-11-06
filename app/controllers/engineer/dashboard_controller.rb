class Engineer::DashboardController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action
  layout 'engineer'
  def index

  end
  
end