require 'spec_helper'

RSpec.describe "/" do
  before do
	get "/"
  end

  it "returns Darkside Taco" do
	expect(last_response.body).to have_tag 'h1', :text => 'Darkside Taco'
  end
  
  it "finds the order form on the page" do
    expect(last_response.body).to have_form '/order', 'post'
  end
  
  it "finds the order button" do
    expect(last_response.body).to have_tag 'input', :with => { :type => 'submit' }
  end
end
