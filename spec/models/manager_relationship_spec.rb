require 'spec_helper'

describe ManagerRelationship do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:bar) { FactoryGirl.create(:bar) }
  let(:manager_relationship) { user.manager_relationships.build(bar_id: bar.id) }

  subject { manager_relationship }

  it { should be_valid }

  describe "when user id is not present" do
  	before { manager_relationship.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when bar id is not present" do
  	before  {manager_relationship.bar_id = nil }
  	it { should_not be_valid }
  end

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			ManagerRelationship.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  describe "manager methods" do
  	it { should respond_to(:user) }
  	it { should respond_to(:bar) }
  	its(:user) { should == user }
  	its(:bar) { should == bar }
  end
end
