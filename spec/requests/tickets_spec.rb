# frozen_string_literal: true

require "rails_helper"
require "shared/request_helpers.rb"

RSpec.describe "Tickets", type: :request do
  sign_in

  let(:category) { FactoryBot.create(:category) }
  let(:member) { FactoryBot.create(:member) }
  let(:language) { FactoryBot.create(:language) }
  let(:subject) { FactoryBot.create(:subject) }
  let(:time) { Time.now }
  let(:date) { Date.today }

  def params
    {
      ticket: {
        category_id: category.id,
        date: date,
        start_time: time,
        duration: 100,
        description: "Description",
        member_checkboxes: {
          "#{member.id}": "1"
        },
        subject_checkboxes: {
          "#{subject.id}": "1"
        },
        language_checkboxes: {
          "#{language.id}": "1"
        }
      }
    }
  end

  def expected_ticket_values(ticket)
    expect(ticket.category_id).to eq category.id
    expect(ticket.date).to eq date
    expect(ticket.start_time).to be_truthy
    expect(ticket.duration).to eq 100
    expect(ticket.description).to eq "Description"
    expect(ticket.member_groups.first.member).to eq member
    expect(ticket.subject_groups.first.subject).to eq subject
    expect(ticket.language_groups.first.language).to eq language
  end

  describe "GET /tickets/new" do
    it "return 200 status response" do
      get new_ticket_path

      expect(response.status).to eq 200
    end
  end

  describe "POST /tickets" do
    context "with valid params" do
      before do
        post tickets_path, params: params
      end

      it "create a new ticket" do
        expect(response).to redirect_to notes_path
        expected_ticket_values Ticket.first
      end

      it "sets a flash message" do
        ticket = Ticket.first
        expect(flash[:success]).to eq "#{ticket.category.name} ticket has been added!"
      end
    end

    context "with invalid params" do
      before do
        post tickets_path, params: {ticket:{duration: 40}}
      end

      it "renders the edit page" do
        expect(response).to render_template "new"
      end

      it "sets a flash message" do
        expect(flash[:warning]).to eq "An error occured please try again"
      end
    end
  end

  describe "GET /tickets/:id/edit" do
    it "return 200 status response" do
      ticket = FactoryBot.create(:ticket, user: user)
      get edit_ticket_path(ticket)

      expect(response.status).to eq 200
    end
  end

  describe "PATCH /tickets/:id" do
    before do
      old_category = FactoryBot.create(:category)
      ticket = FactoryBot.create(:ticket, user: user, category: old_category, date: Date.tomorrow, duration: 200, description: "Old description")
      patch "/tickets/#{ticket.id}", params: params
    end

    it "update a tickets values" do
      expect(response).to redirect_to notes_path
      expected_ticket_values Ticket.first
    end

    it "set a flash message" do
      ticket = Ticket.first
      expect(flash[:success]).to eq "#{ticket.category.name} ticket has been updated!"
    end
  end

  describe "DELETE /tickets/:id" do
    it "remove a ticket" do
      ticket = FactoryBot.create(:ticket, user:user)

      delete ticket_path(ticket)

      expect(Ticket.count).to be_zero
    end
  end
end
