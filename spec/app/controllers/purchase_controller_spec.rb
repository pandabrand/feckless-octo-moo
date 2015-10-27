require 'spec_helper'

RSpec.describe "/purchase" do
  before do
	post "purchase", {:phone => "3125551234", :address => "1234 Fake St\nApt3d"}, { 'rack.session' => { :order => { :items => {:prod_7Ab8nEB9FGA7wv => "2", :prod_78NZR6NzHYSvOv => "1", :prod_78NXCykA4x1Ewe => "2"}}}}
  end

  it "returns purhcase title" do
	expect(last_response.body).to have_tag 'h1', :text => "Payment"
  end

  it "finds the payment form on the page" do
    expect(last_response.body).to have_form 'thanks', 'POST'
  end
end
