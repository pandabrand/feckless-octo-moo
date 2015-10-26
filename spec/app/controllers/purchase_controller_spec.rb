require 'spec_helper'

RSpec.describe "/purchase" do
  before do
	post "purchase"
  end

  it "returns purhcase title" do
	expect(last_response.body).to have_tag 'h1', :text => "Payment"
  end

  it "finds the payment form on the page" do
    expect(last_response.body).to have_form 'thanks', 'POST'
  end
end
