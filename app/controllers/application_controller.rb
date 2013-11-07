class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_visitor
    @visitor ||= Visitor.find(session[:visitor_id]) if session[:visitor_id]
    @visitor ||= Visitor.new
  end

  helper_method :current_visitor
end
