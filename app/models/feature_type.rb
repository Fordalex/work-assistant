class FeatureType < ApplicationRecord
  belongs_to :collection
  has_many :features
  has_rich_text :content
end
