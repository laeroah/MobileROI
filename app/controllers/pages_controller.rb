class PagesController < ApplicationController
  before_action :set_project
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = @project.pages.all
    gon.widgets_hash = Hash.new()
    for page in @pages
      gon.widgets_hash[page.id] = page.widgets
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = @project.pages.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = @project.pages.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to [@project, @page], notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: [@project, @page] }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to [@project, @page], notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: [@project, @page] }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_page
      @page = @project.pages.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def page_params
      params.require(:page).permit(:project_id, :name, :image, :width, :height)
    end
end
