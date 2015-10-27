require 'spec_helper'

RSpec.describe "Darksidetwo::App::ThankHelper" do
    let(:helpers){ Class.new }
    before { helpers.extend Darksidetwo::App::ThankHelper }
    subject { helpers }

#     it "should return nil" do
#       expect(subject.foo).to be_nil
#     end
end
