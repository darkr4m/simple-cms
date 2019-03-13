class SectionsController < ApplicationController
  layout 'admin'
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section_count = Section.count + 1
    @pages = Page.sorted_asc
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = 'Page created successfully.'
    else
      @section_count = Section.count + 1
      @pages = Page.sorted_asc
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted_asc
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = 'Section update successfully.'
      redirect_to(sections_path)
    else
      @section_count = Section.count
      @pages = Page.sorted_asc
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = 'Section destroyed successfully.'
    redirect_to(sections_path)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
