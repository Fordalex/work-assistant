class FeatureGroup < ApplicationRecord
  belongs_to :ticket
  belongs_to :feature
end
