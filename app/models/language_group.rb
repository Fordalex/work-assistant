class LanguageGroup < ApplicationRecord
  belongs_to :language
  belongs_to :ticket
end
