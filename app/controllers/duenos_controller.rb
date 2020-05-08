class DuenosController < ApplicationController
  before_action :set_dueno, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!
  before_action :set_sidebar

  # GET /duenos
  # GET /duenos.json
  def index
    @duenos = Dueno.all
  end
  def misduenos
    @account = Account.find(params[:id])
    @prop = Property.where(:account => Account.find(params[:id])).pluck(:duenos_id)
    @duenos = Dueno.where(:id => @prop)
  end

  # GET /duenos/1
  # GET /duenos/1.json
  def show
  end

  # GET /duenos/new
  def new
    @dueno = Dueno.new
  end

  # GET /duenos/1/edit
  def edit
  end

  # POST /duenos
  # POST /duenos.json
  def create
    @dueno = Dueno.new(dueno_params)

    respond_to do |format|
      if @dueno.save
        format.html { redirect_to @dueno, notice: 'Dueno was successfully created.' }
        format.json { render :show, status: :created, location: @dueno }
      else
        format.html { render :new }
        format.json { render json: @dueno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /duenos/1
  # PATCH/PUT /duenos/1.json
  def update
    respond_to do |format|
      if @dueno.update(dueno_params)
        format.html { redirect_to @dueno, notice: 'Dueno was successfully updated.' }
        format.json { render :show, status: :ok, location: @dueno }
      else
        format.html { render :edit }
        format.json { render json: @dueno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duenos/1
  # DELETE /duenos/1.json
  def destroy
    @dueno.destroy
    respond_to do |format|
      format.html { redirect_to duenos_url, notice: 'Dueno was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_sidebar
      @show_sidebar = true
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_dueno
      @dueno = Dueno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dueno_params
      params.require(:dueno).permit(:first_name, :last_name, :email, :tel, :cel, :comments, :property_id)
    end
end
