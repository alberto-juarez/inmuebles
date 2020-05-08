class PublicController < ApplicationController
  def main
    # if account_signed_in?
    #   path = current_account.admin?  ? accounts_path : dashboard_index_path
    #   redirect_to path,flash: {success: "Inicio de sesión exitoso!"} and return
    # end
    @featured = Property.where(featured: true).limit(9)
    @properties = Property.all
  end
end
