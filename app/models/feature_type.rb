class FeatureType < ApplicationRecord
  belongs_to :collection
  has_many :features, dependent: :destroy
  has_rich_text :content
end
