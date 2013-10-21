class SiteController < ApplicationController
  def index
  end

  def tour
    render layout: 'tour'
  end
end
