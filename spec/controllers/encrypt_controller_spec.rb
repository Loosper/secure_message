require 'rails_helper'

RSpec.describe EncryptController, type: :controller do
  # REVIEW: i honestly don't know how to do this: database is wiped every run
  # and i have no idea of the order of the tests. Also i can't send requests to
  # another controller from here, so i cant figure out a way to get a valid key_id
  # or put something in the database. I could do it from here, but then i have
  # to test that as well

  # VALID_KEYS = { 'n' => 899, 'e' => 11, 'd' => 611 }

  # let(:key_id) do
  #   post :new, params: VALID_KEYS
  #   response.body.to_i
  # end

  # let(:message_id) do
  #   post :create, params: { id: key_id, message: "Hello" }
  #   response.body.to_i
  # end

  # describe "GET /rsas/:id/encrypt_messages/" do
  #   it "returns a valid id" do
  #     expect(response.body.to_i).to be_kind_of(Integer)
  #   end
  #
  #   it "responds with success" do
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET /rsas/:id/encrypt_messages/:msg_id" do
  #     let(:cyphertext) do
  #       get :show, params: { id: key_id, msg_id: message_id }
  #       response.body
  #     end
  #
  #     it "returns a valid cyphertext" do
  #       expect(cyphertext).to be_kind_of(String)
  #     end
  #
  #     it "responds with success" do
  #       expect(response).to have_http_status(:success)
  #     end
  # end
end
