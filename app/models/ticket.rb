class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :subject_groups
  has_many :member_groups
  has_many :language_groups
end
