require "rails_helper"

RSpec.describe TicketsHelper, type: :helper do
  let(:user) { FactoryBot.create(:user) }
  let(:mhp) { FactoryBot.create(:category, name: "MHP") }
  let(:tms) { FactoryBot.create(:category, name: "TMS") }
  let(:ticket_one) { FactoryBot.create(:ticket, category: mhp) }
  let(:ticket_two) { FactoryBot.create(:ticket, category: tms) }
  let(:ticket_three) { FactoryBot.create(:ticket, category: tms) }
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
      expect(all_categories_with_count(week_tickets)).to eq( { MHP: 1, TMS: 2 } )
    end
  end
end
