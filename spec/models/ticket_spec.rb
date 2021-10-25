require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:subject_groups) }
    it { should have_many(:member_groups) }
  end
end
