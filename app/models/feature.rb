class Feature < ApplicationRecord
  belongs_to :user
  belongs_to :feature_type
  has_many :feature_groups
end
