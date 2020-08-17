require "rails_helper"

RSpec.describe "redirect from new user form", :type => :request do
  it "redirects to the front page" do
    get "/users/sign_up"
    response.should redirect_to("/?locale=en")
  end
end
