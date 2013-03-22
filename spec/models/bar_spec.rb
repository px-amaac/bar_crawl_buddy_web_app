# == Schema Information
#
# Table name: bars
#
#  id         :integer          not null, primary key
#  bar_name   :string(255)
#  lat        :float
#  long       :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Bar do
  
  before do
  	@bar = Bar.new( bar_name: "banshee", lat: 123213.23, long: 123321.21, password: "password", password_confirmation: "password")
  end
  subject { @bar }

  it { should respond_to(:bar_name) }
  it { should respond_to(:lat) }
  it { should respond_to(:long) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }

  describe "when bar name is not present" do
  	before { @bar.bar_name = " " }
  	it { should_not be_valid }
  end
  describe "when bar name is too long" do
  	before { @bar.bar_name = "a" * 51 }
  	it { should_not be_valid }
  end

  describe "when lat is not present" do
  	before { @bar.lat = " " }
  	it { should_not be_valid }
  end

  describe "when long is not present" do
  	before { @bar.long = " " }
  	it { should_not be_valid }
  end
  describe "when password is not present" do
    before{ @bar.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  describe "when password doesn't match confirmation" do
    before { @bar.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @bar.password_confirmation = nil }
    it { should_not be_valid }
  end
describe "with a password that's too short" do
    before { @bar.password = @bar.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @bar.save }
    let(:found_bar) { Bar.find_by_lat_and_long(@bar.lat, @bar.long) }

    describe "with valid password" do
      it { should == found_bar.authenticate(@bar.password) }
    end

    describe "with invalid password" do
      let(:bar_for_invalid_password) { found_bar.authenticate("invalid") }

      it { should_not == bar_for_invalid_password }
      specify { bar_for_invalid_password.should be_false }
    end
  end


end
