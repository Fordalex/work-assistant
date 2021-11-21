class Feature < ApplicationRecord
  FEATURE_TICKET_TYPES = [
    "Select",
    "Text"
  ]

  belongs_to :feature_type
  has_many :feature_groups
end
