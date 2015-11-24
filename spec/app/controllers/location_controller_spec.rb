require 'spec_helper'

RSpec.describe "/location" do
  describe "with correct parameters" do
    let(:order) {{"prod_7Ct8O4yDF5kiHk" => "0", "prod_7Ab8nEB9FGA7wv" => "2", "prod_78NZR6NzHYSvOv" => "1", "prod_78NXCykA4x1Ewe" => "2"}}

    before do
      post '/order', order
    end
    
    it "finds the delivery information form on the page" do
      expect(last_response.body).to have_form '/purchase', 'post'
    end

    it "finds phone number input on the page" do
      expect(last_response.body).to have_tag 'input', :with => { :name => 'del_phone' }
    end
  
    it "returns Contact and Delivery title" do
      expect(last_response.body).to have_tag 'h3', :text => "Contact and Delivery Information"
    end
  end
end
