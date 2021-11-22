require "rails_helper"

RSpec.describe TicketsHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }
  let(:mhp) { FactoryBot.create(:category, name: "MHP", colour: "#fff") }
  let(:tms) { FactoryBot.create(:category, name: "TMS", colour: "#000") }
  let(:ticket_one) { FactoryBot.create(:ticket, category: mhp, duration: 32) }
  let(:ticket_two) { FactoryBot.create(:ticket, category: tms, duration: 10) }
  let(:ticket_three) { FactoryBot.create(:ticket, category: tms, duration: 65) }
  let(:modays_tickets) { [ ticket_one ] }
  let(:tuesdays_tickets) { [ ticket_two, ticket_three ] }
  let(:week_tickets) do
    {
      monday: {
        date: "#{Date.today}",
        tickets: modays_tickets
      },
      tuesday: {
        date: "#{Date.today}",
        tickets: tuesdays_tickets
      }
    }
  end

  # describe "#all_week_tickets" do
  #   it "return all the tickets" do
  #     expect(all_week_tickets(week_tickets)).to eq [ticket_one, ticket_two, ticket_three]
  #   end
  # end

  # describe "#total_tickets" do
  #   it "return the total count of all tickets" do
  #     expect(total_tickets(week_tickets)).to eq 3
  #   end
  # end

  # describe "#all_categories_stats" do
  #   it "return hash of categories with count" do
  #     expect(all_categories_stats(week_tickets)).to eq( { MHP: { category: "MHP", colour: "#fff", count: 1, duration: 32 }, TMS: { category: "TMS",colour: "#000", count: 2, duration: 75 } } )
  #   end
  # end

  # describe "#values_for_chart" do
  #   it "return a string of the given attribute" do
  #     expect(values_for_chart(week_tickets, :duration)).to eq "32 75"
  #     expect(values_for_chart(week_tickets, :colour)).to eq "#fff #000"
  #   end
  # end

  # describe "#total_duration" do
  #   it "return array of the durations" do
  #     expect(total_duration(week_tickets)).to eq 107
  #   end

  #   it "return zero" do
  #     expect(total_duration(nil)).to eq 0
  #   end
  # end

  # describe "#time_conversion" do
  #   it "return the correct format" do
  #     expect(time_conversion(62)).to eq "1h : 02m"
  #     expect(time_conversion(0)).to eq "0h : 00m"
  #     expect(time_conversion(nil)).to eq "0h : 00m"
  #   end
  # end

  describe "#sort_feature_groups" do
    it "should group features to their feature type" do
      collection = FactoryBot.create(:collection)
      FactoryBot.create(:user_group, user: user, collection: collection)
      members = FactoryBot.create(:feature_type, name: "Members", collection: collection)
      david = FactoryBot.create(:feature, feature_type: members, name: "David" )
      bob = FactoryBot.create(:feature, feature_type: members, name: "Bob" )
      ticket = FactoryBot.create(:ticket, collection: collection)
      davids_feature_group = FactoryBot.create(:feature_group, ticket: ticket, feature: david, text: "Davids note")
      bobs_feature_group = FactoryBot.create(:feature_group, ticket: ticket, feature: bob)
      feature_groups = [davids_feature_group, bobs_feature_group]
      expect(sort_feature_groups(feature_groups)).to eq [{feature_type: "Members", features: [{name: "David", text: "Davids note"},{name: "Bob", text: ""}]}]
    end
  end
end
