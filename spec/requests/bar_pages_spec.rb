require 'spec_helper'

describe "Bar pages" do
	subject { page }

	describe "bar index" do
		before do
			sign_in FactoryGirl.create(:admin)
			FactoryGirl.create(:bar, bar_name: "Bob", lat: 321232.12, long: 321232.23)
			FactoryGirl.create(:bar, bar_name: "Benb", lat: 321132.12, long: 332132.23)
			visit bars_path
		end

		it { should have_selector('title', text: 'All Bars') }
		it { should have_selector('h1', text: 'All Bars') }

		it "should list each user" do
			Bar.all.each do |bar|
				page.should have_selector('li', text: bar.bar_name)
			end
		end
	end

	describe "bar page" do
		let(:bar) { FactoryGirl.create(:bar) }
		let(:user) { FactoryGirl.create(:user) }

		before(:each) do
			sign_in user
			visit bar_path(bar)
		end
		it { should have_selector('h1',    text: bar.bar_name) }
  		it { should have_selector('title', text: bar.bar_name) }

  		describe "manage/unmanage buttons" do
  			before { visit bar_path(bar) }

  			describe "managing" do 
  				let(:manage) { "Manage" }
  				before do
  					fill_in "Password", with: "password"
  				end
  				it "should increment the user bars count" do
  					expect do
  						click_button manage
  					end.to change(user.bars, :count).by(1)
  				end

  				it "should increment the bars users count" do
  					expect do
  						click_button manage
  					end.to change(bar.users, :count).by(1)
  				end

  				describe "toggling the button" do
  					before { click_button manage }
  					it {should have_selector('input', value: 'Unmanage') }
  				end
  			end
  		end
  			describe "unmanaging a bar" do
  				before do
  					user.manage!(bar)
  					visit bar_path(bar)
  				end

  				it "should decrement the users bars count" do
  					expect do
  						click_button "Unmanage"
  					end.to change(user.bars, :count).by(-1)
  				end
  				it "should decrement the bars users count" do
  					expect do
  						click_button "Unmanage"
  					end.to change(bar.users, :count).by(-1)
  				end

  				describe "toggling the button" do
  					before { click_button "Unmanage" }
  						it { should have_selector('input', value: 'Manage') }
  				end
  			end

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