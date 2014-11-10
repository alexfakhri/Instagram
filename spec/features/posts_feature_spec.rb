require 'rails_helper'

describe 'posts' do
	context 'no posts have been added' do
		it 'should display a prompt to add a post' do
			visit '/posts'
			expect(page).to have_content 'No posts'
			expect(page).to have_link 'Add a post'
		end
	end
end

