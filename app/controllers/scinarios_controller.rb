class ScinariosController < ApplicationController
  before_action :set_scinario, only: [:show, :edit, :update, :destroy]

  # GET /scinarios
  # GET /scinarios.json
  def index
    @scinarios = Scinario.all
  end

  # GET /scinarios/1
  # GET /scinarios/1.json
  def show
  end

  # GET /scinarios/new
  def new
    @scinario = Scinario.new
  end

  # GET /scinarios/1/edit
  def edit
  end

  # POST /scinarios
  # POST /scinarios.json
  def create
    @scinario = Scinario.new(scinario_params)

    respond_to do |format|
      if @scinario.save
        format.html { redirect_to @scinario, notice: 'Scinario was successfully created.' }
        format.json { render :show, status: :created, location: @scinario }
      else
        format.html { render :new }
        format.json { render json: @scinario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scinarios/1
  # PATCH/PUT /scinarios/1.json
  def update
    respond_to do |format|
      if @scinario.update(scinario_params)
        format.html { redirect_to @scinario, notice: 'Scinario was successfully updated.' }
        format.json { render :show, status: :ok, location: @scinario }
      else
        format.html { render :edit }
        format.json { render json: @scinario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scinarios/1
  # DELETE /scinarios/1.json
  def destroy
    @scinario.destroy
    respond_to do |format|
      format.html { redirect_to scinarios_url, notice: 'Scinario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scinario
      @scinario = Scinario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scinario_params
      params.require(:scinario).permit(:name)
    end
end
