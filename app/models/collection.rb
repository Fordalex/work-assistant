class Collection < ApplicationRecord
  has_many :user_groups
  has_many :tickets
  has_many :feature_types
end
