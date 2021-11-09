require "rails_helper"

RSpec.describe JobTypeGroup, type: :model do
  describe "Association" do
    it { should belong_to(:job_type) }
    it { should belong_to(:ticket) }
  end
end
