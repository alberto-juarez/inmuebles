class ClientController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(property_params)
    @client.account_id = current_account.id
  end
  private
  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:client).permit(:id,:email,:first_name,:last_name,:comentarios)
  end
end
