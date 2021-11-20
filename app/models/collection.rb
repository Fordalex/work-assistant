class Collection < ApplicationRecord
  has_many :users
  has_many :tickets
  has_many :feature_types
end
