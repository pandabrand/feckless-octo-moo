require 'spec_helper'

RSpec.describe "Darksidetwo::Admin::OrdersHelper" do
  pending "add some examples to (or delete) #{__FILE__}" do
    let(:helpers){ Class.new }
    before { helpers.extend Darksidetwo::Admin::OrdersHelper }
    subject { helpers }

    it "should return nil" do
      expect(subject.foo).to be_nil
    end
  end
end
