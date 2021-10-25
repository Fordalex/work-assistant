class MemberGroup < ApplicationRecord
  belongs_to :ticket
  belongs_to :member
end
