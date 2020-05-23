class PropertiesController < ApplicationController
  require 'mini_magick'
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!,only: [:new,:create,:destroy,:index,:featured]
  before_action :set_sidebar, except: [:show,:search,:showpdf]
  before_action :set_none, only: [:showpdf]
  # GET /properties
  # GET /properties.json
  def toggle_fav
    @property = Property.find(params[:id])
    current_usertemp.favorited?(@property)  ? current_usertemp.unfavorite(@property) : current_usertemp.favorite(@property)
  end

  def index
    @featured = Property.where(featured: true)
    @asesores = Account.all.pluck(:first_name)
    @properties = Property.all

    # @mine = Property.where(account: Account.find(params[:id]))
    # @featured_properties= Property.featured
  end

  def update_multiple
    Property.where(id: params[:ids]).update_all(featured: true)
    Property.where.not(id: params[:ids]).update_all(featured: false)
  # Property.update_all([:featured => true], :id => params[:ids])
   # @properties = Property.where(id: params[:coleccion]).update_all(:featured => true)
   # @properties.each do |property|
   #   property.update_attributes!(params[:coleccion].reject { |k,v| v.blank? })
   # end
   # flash[:notice] = "Updated products!"
   redirect_to featured_path
  end

  def featured
    @properties = Property.all
    @properties = Property.where(id: params[:coleccion]).update_all(:featured => true)
    @actuales = Property.where(featured: true)
    @todas = Property.all
  end

  def search
    @properties = Property.where(nil)
    filtering_params(params).each do |key, value|
      @properties = @properties.public_send("filter_by_#{key}", value) if value.present?
    end
    # @properties = Property.where("colonia LIKE ?",params[:colonia])
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @agent = @property.account
    @count = Property.where(zona: @property.zona).where.not(id: @property).count
    @neighbourhood = Property.where(zona: @property.zona).where.not(id: @property).limit(3)
  end

  # GET /properties/new
  def new
    @duenos = Dueno.all.pluck(:first_name,:id)
    @asesores = Account.all.pluck(:first_name,:id)
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    @duenos = Dueno.all.pluck(:first_name,:id)
    @asesores = Account.all.pluck(:first_name,:id)

  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    # params[:property][:cover_picture].each do |image|
      mini_image = MiniMagick::Image.new(params[:property][:cover_picture].tempfile.path)
      mini_image.resize '1200x1200'
    # end
    # params[:property][:pictures].each do |image|
    #   mini_image = MiniMagick::Image.new(params[:property][image].tempfile.path)
    #   mini_image.resize '1200x1200'
    # end
    # @property.account_id = current_account.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def filtering_params(params)
      params.slice(:colonia,:zona,:tipoOp,:tipoProp)
    end

    def set_none
      @show_none = true
    end

    def set_sidebar
      @show_sidebar = true
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:id,:account_id,:featured,:comision,:duenos_id,:descripcion,:tipoOp,:tipoProp, :zona, :colonia, :precio, :mConst, :mTerreno, :banos,:ac,:alarm,:lift,:balcony,:furnished,:bbq,:heating,:fireplace,:backyard,:pool,:terrace,:security,:comision, :recamaras,:cover_picture,pictures: [],ids: [])
    end
end
