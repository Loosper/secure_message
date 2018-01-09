require 'rails_helper'
require 'json'

RSpec.describe RsaController, type: :controller do
  VALID_KEYS = { 'n' => 899, 'e' => 11, 'd' => 611 }

  describe "POST /rsas/" do
    context "handles normal requests" do
      before { post :new }

      it "returns a valid id" do
        expect(response.body.to_i).to be_kind_of(Integer)
      end

      it "responds with 200" do
        expect(response).to have_http_status(:success)
      end
    end

    context "saves correctly" do
      it "returns a valid id" do
        post :new, params: VALID_KEYS
        expect(response.body.to_i).to be_kind_of(Integer)
      end

      it "doesn't succeed on bad request" do
        post :new, params: {e: "asd", d: "611"}
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET /rsas/:id" do
    let(:key_id) do
      post :new, params: VALID_KEYS
      # key_id =
      response.body.to_i
    end

    before { get :show, params: { id: key_id } }

    it "responds http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns the same keys" do
      expect(JSON.parse response.body).to eql(VALID_KEYS)
    end
  end
end
