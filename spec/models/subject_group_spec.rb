require "rails_helper"

RSpec.describe SubjectGroup, type: :model do
  describe "Association" do
    it { should belong_to(:ticket) }
    it { should belong_to(:subject) }
  end
end
