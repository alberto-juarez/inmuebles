class Prospecto < ApplicationRecord
  belongs_to :account
  has_rich_text :statuscomment
  has_rich_text :comment
end
