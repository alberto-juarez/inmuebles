class Message < ApplicationRecord
  belongs_to :account
  has_rich_text :mensaje
end
