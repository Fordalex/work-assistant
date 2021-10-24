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

  describe "#all_week_tickets" do
    it "return all the tickets" do
      expect(all_week_tickets(week_tickets)).to eq [ticket_one, ticket_two, ticket_three]
    end
  end

  describe "#total_tickets" do
    it "return the total count of all tickets" do
      expect(total_tickets(week_tickets)).to eq 3
    end
  end

  describe "#total_tickets" do
    it "return hash of categories with count" do
      expect(all_categories_stats(week_tickets)).to eq( { MHP: { colour: "#fff", count: 1, duration: 32 }, TMS: { colour: "#000", count: 2, duration: 75 } } )
    end
  end
end
