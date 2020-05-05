class DashboardController < ApplicationController
  before_action :set_sidebar
  before_action :authenticate_account!
  def index
  end

  def newclient
    @client = Client.new(property_params)
  end

  def clients
    @clients = Client.all
  end

  def properties
  end

  def accounts
    @accounts = Account.all
  end

  def reports
    @total = Property.all.count
    @venta = Property.where(:tipoOp => "Venta").count
    @renta = Property.where(:tipoOp => "Renta").count
  end

  def profile
    @account = Account.find(params[:id])
    @mine = Property.where(:account => Account.find(params[:id]))
  end

  def set_sidebar
    @show_sidebar = true
  end
  private
  def property_params
    params.permit(:id,:email,:first_name,:last_name,:comentarios)
  end
end
