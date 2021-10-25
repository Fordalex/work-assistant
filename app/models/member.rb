class Member < ApplicationRecord
  belongs_to :user
  has_many :member_groups

end
