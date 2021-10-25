require "rails_helper"

RSpec.describe MemberGroup, type: :model do
  describe "Association" do
    it { should belong_to(:ticket) }
    it { should belong_to(:member) }
  end
end
