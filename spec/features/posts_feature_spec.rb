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


context 'posts have been added' do
	before do
		Post.create(title: 'Test Title')
	end

	it 'should display posts' do
		visit '/posts'
		expect(page).to have_content('Test Title')
		expect(page).not_to have_content('No posts')
	end
end

describe 'creating posts' do
	it 'prompts user to fill out a form, then displays the new post' do
		visit '/posts'
		click_link 'Add a post'
		fill_in 'Title', with: 'Test Title'
		click_button 'Create Post'
		expect(page).to have_content 'Test Title'
		expect(current_path).to eq '/posts'
	end
end
