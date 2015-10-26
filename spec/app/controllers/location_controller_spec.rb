require 'spec_helper'

RSpec.describe "/location" do
  before do
    post 'order'
  end
  
  it "finds the delivery information form on the page" do
    expect(last_response.body).to have_form '/order', 'post'
  end

  it "finds phone number input on the page" do
    expect(last_response.body).to have_tag 'input', :with => { :name => 'del_phone' }
  end
  
  it "returns Contact and Delivery title" do
	expect(last_response.body).to have_tag 'h1', :text => "Contact and Delivery Information"
  end
end
