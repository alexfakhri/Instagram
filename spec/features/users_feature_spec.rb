require 'rails_helper'

context 'user not signed in on the homepage' do
	it "should see a 'Sign in' link and a 'Sign up' link" do
		visit ('/')
		expect(page).to have_link('Sign in')
		expect(page).to have_link('Sign up')
	end
end