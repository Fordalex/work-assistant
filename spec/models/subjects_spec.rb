require "rails_helper"

RSpec.describe Subject, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should have_many(:subject_groups) }
  end
end
