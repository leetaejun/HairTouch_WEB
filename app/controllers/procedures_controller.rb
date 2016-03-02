class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /procedures
  # GET /procedures.json
  def index
    @procedures = Procedure.all
    respond_with(@procedures)
  end

  # GET /procedures/1
  # GET /procedures/1.json
  def show
    respond_with(@procedure)
  end

  # GET /procedures/new
  def new
    @procedure = Procedure.new
    respond_with(@procedure)
  end

  # GET /procedures/1/edit
  def edit
  end

  # POST /procedures
  # POST /procedures.json
  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.save
    respond_with(@procedure)
  end

  # PATCH/PUT /procedures/1
  # PATCH/PUT /procedures/1.json
  def update
    @procedure.update(procedure_params)
    respond_with(@procedure)
  end

  # DELETE /procedures/1
  # DELETE /procedures/1.json
  def destroy
    @procedure.destroy
    respond_with(@procedure)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procedure_params
      params.require(:procedure).permit(:designer_id, :title, :subtitle, :content)
    end
end
