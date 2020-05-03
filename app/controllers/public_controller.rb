class PublicController < ApplicationController
  def main
    if account_signed_in?
      redirect_to dashboard_index_path,flash: {success: "Inicio de sesión exitoso!"} and return 
    end
    @properties = Property.all
  end
end
