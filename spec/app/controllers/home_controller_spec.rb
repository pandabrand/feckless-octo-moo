require 'spec_helper'

RSpec.describe "/" do
  before do
	get "/"
  end

  it "returns Welcome to Darkside Taco" do
	expect(last_response.body).to have_tag 'h1', :text => 'Welcome to Darkside Taco'
  end
  
  it "finds the order form on the page" do
    expect(last_response.body).to have_form 'order', 'POST'
  end
  
  it "finds order items on the page" do
    expect(last_response.body).to have_tag 'div', :with => { :class => 'order-item' }
  end
  
  it "finds the order button" do
    expect(last_response.body).to have_tag 'button', :with => { :type => 'submit' }
  end
end
