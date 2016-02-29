class DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /designers
  # GET /designers.json
  def index
    @designers = Designer.all
    respond_with(@designers)
  end

  # GET /designers/1
  # GET /designers/1.json
  def show
    respond_with(@designer)
  end

  # GET /designers/new
  def new
    @designer = Designer.new
    respond_with(@designer)
  end

  # GET /designers/1/edit
  def edit
  end

  # POST /designers
  # POST /designers.json
  def create
    @designer = Designer.new(designer_params)
    ImageHelper.create_single_image(params[:image], @designer)
    @designer.save
    DesignersHelper.gen_designer_auth(@designer).access_token
    respond_with(@designer)
  end

  # PATCH/PUT /designers/1
  # PATCH/PUT /designers/1.json
  def update
    @designer.update(designer_params)
    ImageHelper.update_single_image(params[:image], @designer)
    respond_with(@designer)
  end

  # DELETE /designers/1
  # DELETE /designers/1.json
  def destroy
    @designer.destroy
    respond_with(@designer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_designer
      @designer = Designer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def designer_params
      params.require(:designer).permit(:email, :password, :nickname, :image)
    end
end
