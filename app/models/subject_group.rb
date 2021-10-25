class SubjectGroup < ApplicationRecord
  belongs_to :ticket
  belongs_to :subject
end
