class ProspectosController < ApplicationController
  before_action :set_prospecto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!
  before_action :set_sidebar
  # GET /prospectos
  # GET /prospectos.json
  def index
    @prospectos = Prospecto.all
  end

  def misprospectos
    @prospectos = Prospecto.where(:account => params[:id])
  end

  # GET /prospectos/1
  # GET /prospectos/1.json
  def show
  end

  # GET /prospectos/new
  def new
    @asesores = Account.all.pluck(:first_name,:id)
    @prospecto = Prospecto.new
  end

  # GET /prospectos/1/edit
  def edit
  end

  # POST /prospectos
  # POST /prospectos.json
  def create
    @prospecto = Prospecto.new(prospecto_params)

    respond_to do |format|
      if @prospecto.save
        format.html { redirect_to @prospecto, notice: 'Prospecto was successfully created.' }
        format.json { render :show, status: :created, location: @prospecto }
      else
        format.html { render :new }
        format.json { render json: @prospecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prospectos/1
  # PATCH/PUT /prospectos/1.json
  def update
    respond_to do |format|
      if @prospecto.update(prospecto_params)
        format.html { redirect_to @prospecto, notice: 'Prospecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @prospecto }
      else
        format.html { render :edit }
        format.json { render json: @prospecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prospectos/1
  # DELETE /prospectos/1.json
  def destroy
    @prospecto.destroy
    respond_to do |format|
      format.html { redirect_to prospectos_url, notice: 'Prospecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sidebar
      @show_sidebar = true
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_prospecto
      @prospecto = Prospecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prospecto_params
      params.require(:prospecto).permit(:first_name, :last_name, :email, :tel, :status, :statuscomment, :comment,:account_id)
    end
end
