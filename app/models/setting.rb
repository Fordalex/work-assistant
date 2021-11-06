class Setting < ApplicationRecord
  ALLOWED_THEMES = [
    "light",
    "dark"
  ].freeze

  belongs_to :user
end
