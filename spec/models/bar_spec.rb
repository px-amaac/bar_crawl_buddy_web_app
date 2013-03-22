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
  	@bar = Bar.new( bar_name: "banshee", lat: 123213.23, long: 123321.21)
  end
  subject { @bar }

  it { should respond_to(:bar_name) }
  it { should respond_to(:lat) }
  it { should respond_to(:long) }
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

end
