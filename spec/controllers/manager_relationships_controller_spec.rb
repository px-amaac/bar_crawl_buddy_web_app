require 'spec_helper'

describe ManagerRelationshipsController do 

	let (:user) { FactoryGirl.create(:user) }
	let (:bar) { FactoryGirl.create(:bar) }

	before { sign_in user }

	describe "creating a manager relationship with ajax" do

		it "should increment the manager relationship count" do
			expect do
				xhr :post, :create, manager_relationship: { bar_id: bar.id, password: "password" }
			end.to change(ManagerRelationship, :count).by(1)
		end

		it "should respond with success" do
			xhr :post, :create, manager_relationship: { bar_id: bar.id }
			response.should be_success
		end
	end

	describe "destroying a manager relationship with ajax" do

		before { user.manage!(bar) }
		let(:manager_relationship) { user.manager_relationships.find_by_bar_id(bar) }

		it "should decrement the manager relationship count" do
			expect do
				xhr :delete, :destroy, id: manager_relationship.id
			end.to change(ManagerRelationship, :count).by(-1)
		end

		it "should respond with success" do
			xhr :delete, :destroy, id: manager_relationship.id
			response.should be_success
		end
	end
end