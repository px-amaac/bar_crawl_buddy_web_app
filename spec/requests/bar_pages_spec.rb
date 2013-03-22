require 'spec_helper'

describe "Bar pages" do
	subject { page }

	describe "bar page" do
		let(:bar) { FactoryGirl.create(:bar) }
		before { visit bar_path(bar) }

		it { should have_selector('h1',    text: bar.bar_name) }
  		it { should have_selector('title', text: bar.bar_name) }
	end
end