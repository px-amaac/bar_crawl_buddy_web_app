require 'spec_helper'

describe "Bar pages" do
	subject { page }

	describe "bar page" do
		let(:bar) { FactoryGirl.create(:bar) }
		before { visit bar_path(bar) }

		it { should have_selector('h1',    text: bar.bar_name) }
  		it { should have_selector('title', text: bar.bar_name) }
	end
	describe "new bar" do
		let(:admin) { FactoryGirl.create(:admin) }
		before(:each) do
			sign_in admin
			visit new_bar_path
		end

		let(:submit) { "Create Bar" }

		describe "with invalid data" do
			it "should not create a bar" do
				expect { click_button submit }.not_to change(Bar, :count)
			end
		end
		describe "with valid data" do
			before do
				fill_in "Name", 				with: "Fake User"
				fill_in "Lat", 				with: 123321.32
				fill_in "Long", 				with: 321321.32
				fill_in "Password",					with: "password"
				fill_in "Confirmation",	with: "password"
			end

			it "should create a bar" do
				expect { click_button submit }.to change(Bar, :count).by(1)
			end
		end
	end

end