require 'spec_helper'

RSpec.describe "Darksidetwo::App::HomeHelper" do
  let(:helpers){ Class.new }
  before { helpers.extend Darksidetwo::App::HomeHelper }
  subject { helpers }
    it "should return false when nil" do
      expect(subject.lift_gate_helper nil, Time.now).to be_falsy
    end

    it "should return false when today is not found" do
      expect(subject.lift_gate_helper "2015-10-14,2015-12-23", Time.now.to_date).to be false
    end
end
