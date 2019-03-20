class PublicController < ApplicationController

  layout 'public'
  def index
    #intro text
  end

  def show
    @page = Page.visible.where(:permalink => params[:permalink]).first
    if @page.nil?
      redirect_to(root_path)
    end
  end
end