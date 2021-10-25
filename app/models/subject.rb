class Subject < ApplicationRecord
  belongs_to :user
  has_many :subject_groups
end
