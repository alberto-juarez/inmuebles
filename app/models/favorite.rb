# frozen_string_literal: true

class Favorite < ApplicationRecord
  extend ActsAsFavoritor::FavoriteScopes

  belongs_to :favoritable, polymorphic: true
  belongs_to :favoritor, polymorphic: true

  def update
    property = Property.find(params[:ids])
    # `user` favorites `book`.
    if current_usertemp.favorited?(property)
      current_usertemp.unfavorite(property)
    else
      current_usertemp.favorite(property)
    end
    respond_to do |format|
      format.js {}
    end
  end

  def block!
    update!(blocked: true)
  end
end
