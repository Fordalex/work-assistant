class JobTypeGroup < ApplicationRecord
  belongs_to :ticket
  belongs_to :job_type

end
