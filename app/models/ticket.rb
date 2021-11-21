class Ticket < ApplicationRecord
  belongs_to :collection
  has_many :feature_groups
end
