require 'spec_helper'

RSpec.describe "/" do
  before do
	get "/"
  end

  it "returns Welcome to Darkside Taco" do
	expect(last_response.body).to eq "Welcome to Darkside Taco"
  end
end
