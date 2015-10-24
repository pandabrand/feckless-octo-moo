require 'spec_helper'

RSpec.describe "/location" do
  before do
	get "/delivery"
  end

  it "returns hello world" do
	expect(last_response.body).to have_tag 'h1', :text => "Contact and Delivery Information"
  end

  it "finds the delivery information form on the page" do
    expect(last_response.body).to have_form '/purchase', 'POST'
  end

  it "finds phone number input on the page" do
    expect(last_response.body).to have_tag 'input', :with => { :name => 'phone' }
  end
  
end
