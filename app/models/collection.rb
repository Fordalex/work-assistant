class Collection < ApplicationRecord
  TEMPLATES = [
    "Web Developer"
  ]

  has_many :user_groups
  has_many :tickets
  has_many :feature_types
end
