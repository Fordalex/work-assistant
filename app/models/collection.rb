class Collection < ApplicationRecord
  TEMPLATES = [
    "Web Developer"
  ]

  has_many :user_groups
  has_many :tickets, dependent: :destroy
  has_many :feature_types, dependent: :destroy
end
