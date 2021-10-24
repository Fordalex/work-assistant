require "rails_helper"

RSpec.describe Subject, type: :model do
  describe "Association" do
    it { should belong_to(:user) }
  end
end
