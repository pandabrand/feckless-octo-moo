require 'spec_helper'

RSpec.describe "Darksidetwo::App::HomeHelper" do
  let(:helpers){ Class.new }
  before { helpers.extend Darksidetwo::App::HomeHelper }
  subject { helpers }
    it "should return false when nil" do
      expect(subject.lift_gate_helper).to be_false
    end
#   it "should return nil" do
# 	expect(subject.foo).to be_nil
#   end
end
