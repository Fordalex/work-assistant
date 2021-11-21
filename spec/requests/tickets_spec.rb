# frozen_string_literal: true

require "rails_helper"
require "shared/request_helpers.rb"

RSpec.describe "Tickets", type: :request do
  sign_in

  let(:feature_select) { FactoryBot.create(:feature) }
  let(:feature_text) { FactoryBot.create(:feature, feature_ticket_type: "Text") }
  let(:time) { Time.now }
  let(:date) { Date.today }

  def params
    {
      ticket: {
        title: "The title",
        date: date,
        start_time: time,
        duration: 100,
        description: "Description",
        feature_checkboxes: {
          "#{feature_select.id}": "1"
        },
        feature_text: {
          "#{feature_text.id}": "This is custom text."
        }
      }
    }
  end

  def expected_ticket_values(ticket)
    expect(ticket.title).to eq "The title"
    expect(ticket.date).to eq date
    expect(ticket.start_time).to be_truthy
    expect(ticket.duration).to eq 100
    expect(ticket.description).to eq "Description"
    expect(ticket.feature_groups.count).to eq 2
    expect(ticket.feature_groups.last.text).to eq "This is custom text."
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
        expect(flash[:success]).to eq "#{ticket.title} ticket has been added!"
      end
    end

    context "with nil feature_text and feature_checkboxes params" do
      before do
        post tickets_path, params: {
          ticket: {
            title: "The title",
            date: date,
            start_time: time,
            duration: 100,
            description: "Description",
          }
        }
      end

      it "create a new ticket" do
        expect(response).to redirect_to notes_path
        expect(Ticket.count).to eq 1
      end
    end

    # context "with invalid params" do
    #   before do
    #     post tickets_path, params: {ticket:{duration: 40, description: "asdf"}}
    #   end

    #   it "renders the edit page" do
    #     expect(response).to render_template "new"
    #   end

    #   it "sets a flash message" do
    #     expect(flash[:warning]).to eq "An error occured please try again"
    #   end
    # end
  end

  describe "GET /tickets/:id/edit" do
    it "return 200 status response" do
      ticket = FactoryBot.create(:ticket, collection: collection)
      get edit_ticket_path(ticket)

      expect(response.status).to eq 200
    end
  end

  describe "PATCH /tickets/:id" do
    before do
      old_feature = FactoryBot.create(:feature)
      ticket = FactoryBot.create(:ticket, collection: collection, date: Date.tomorrow, duration: 200, description: "Old description")
      feature_group = FactoryBot.create(:feature_group, ticket: ticket, feature: old_feature)
      patch "/tickets/#{ticket.id}", params: params
    end

    it "update a tickets values" do
      expect(response).to redirect_to notes_path
      expected_ticket_values Ticket.first
    end

    it "set a flash message" do
      ticket = Ticket.first
      expect(flash[:success]).to eq "#{ticket.title} ticket has been updated!"
    end
  end

  describe "DELETE /tickets/:id" do
    it "remove a ticket" do
      ticket = FactoryBot.create(:ticket, collection: collection)

      delete ticket_path(ticket)

      expect(Ticket.count).to be_zero
    end
  end
end
