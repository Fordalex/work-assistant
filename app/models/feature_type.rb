class FeatureType < ApplicationRecord
  belongs_to :user
  has_many :features
  has_rich_text :content
end
