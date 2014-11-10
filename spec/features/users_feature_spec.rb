require 'rails_helper'

context 'user not signed in on the homepage' do
	it "should see a 'Sign in' link and a 'Sign up' link" do
		visit ('/')
		expect(page).to have_link('Sign in')
		expect(page).to have_link('Sign up')
	end

	it "should not see the 'sign out' link" do
		visit '/'
		expect(page).to_not have_link('Sign out')
	end

end

context "User signed in on the homepage" do

	before do
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@tes.com')
		fill_in('Password', with: 'testtest')
		fill_in('Password confirmation', with: 'testtest')
		click_button('Sign up')
	end 

	it "should see 'sign out' link" do
		visit '/'
		expect(page).to have_link('Sign out')
	end

	it "Should not see a 'Sign in' link and a 'sign up' link" do
		visit '/'
		expect(page).not_to have_link('Sign in')
		expect(page).not_to have_link('Sign up')
	end

end