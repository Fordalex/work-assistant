class Language < ApplicationRecord
  has_many :language_groups
  belongs_to :user
end
