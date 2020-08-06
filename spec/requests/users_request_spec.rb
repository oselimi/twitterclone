require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /signup" do
    let(:user) { create(:user) }

    it "should be valid" do
      get "/signup"
      expect(response).to have_http_status(:ok)

      post_params = {
        params: {
          user: {
            first_name: "john",
            last_name: "gate",
            email: "john@live.com",
            password: "123456",
            password_confirmation: "123456"
          }
        }
      }

      post "/users", post_params
      
      expect(response).to redirect_to(assigns(:user))
      follow_redirect!
      expect(response.body).to include "john"
      expect(response.body).to include "gate"
    end

    it "create an users should be invalid" do
      get "/signup"
      expect(response).to have_http_status(:ok)
      post_params = {
        params: {
          user: {
            first_name: "",
            last_name: "",
            email: "",
            password: "",
            password_confirmation: ""
          }
        }
      }

      post "/users", post_params

      expect(response).to render_template(:new)
    end
  end  
end
