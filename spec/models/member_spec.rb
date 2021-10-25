require "rails_helper"

RSpec.describe Member, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should have_many(:member_groups) }
  end
end
