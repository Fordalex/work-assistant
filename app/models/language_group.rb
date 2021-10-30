class LanguageGroup < ApplicationRecord
  has_many :languages
  has_many :tickets
end
