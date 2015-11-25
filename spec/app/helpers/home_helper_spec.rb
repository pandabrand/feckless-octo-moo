require 'spec_helper'

RSpec.describe "Darksidetwo::App::HomeHelper" do
  let(:helpers){ Class.new }
  before { helpers.extend Darksidetwo::App::HomeHelper }
  subject { helpers }
    it "should return false when nil" do
      expect(subject.lift_gate_helper nil, 13, [5], Time.now).to be_falsy
    end

    it "should return false when today is not found" do
      expect(subject.lift_gate_helper "2015-10-14,2015-12-23", 13, [5], Time.now).to be false
    end

    it "should return true when date and time is found" do
      t = Time.now
      t = t.change(:hour => 13)
      expect(subject.lift_gate_helper "2015-10-14,2015-12-23,#{Time.now.to_date.to_s}", 13, [5], t).to be true
    end

    it "should return true when time is in range" do
      t = Time.now.change(:hour => 14, :minute => 30)
      expect(subject.lift_gate_helper "2015-10-14,2015-12-23,#{Time.now.to_date.to_s}", 13, [4,30], t).to be true
    end
end
