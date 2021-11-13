require "rails_helper"

RSpec.describe "/api/books", type: :request do
  let(:ruby_microscope) { create(:ruby_microscope) }
  let(:rails_tutorial) { create(:ruby_on_rails_tutorial) }
  let(:agile_web_dev) { create(:agile_web_development) }

  let(:books) { [ruby_microscope, rails_tutorial, agile_web_dev] }

  describe "GET /index" do
    before { books }

    context "with default behaviour" do
      subject(:get_books) { get "/api/books" }

      it "receives HTTP status 200" do
        get_books
        expect(response).to have_http_status(:ok)
      end

      it "receives a json with the \"data\" root key" do
        get_books
        expect(json_body["data"]).not_to be nil
      end

      it "receives all 3 books" do
        get_books
        expect(json_body["data"].size).to eq 3
      end
    end
  end
end
