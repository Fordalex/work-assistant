class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :feature_groups
end
