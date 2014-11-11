require 'rails_helper'

describe 'Liking pictures' do

	before do
		Post.create(title: 'Title', image: File.open("#{Rails.root}/public/images/full-size/test.png"))
	end

	it 'A user can like a photo, whcih updates the photo like count', js: true do
		visit '/'
		click_link 'Title'
		click_link "Like"
		expect(page).to have_content('1')
	end

end