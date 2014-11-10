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
		Post.create(title: 'Title', image: File.open("#{Rails.root}/public/images/full-size/test.png"))
	end

	it 'should display posts' do
		visit '/posts'
		expect(page).to have_content('Title')
		expect(page).not_to have_content('No posts')
	end

	it 'Should display the post photos' do
		visit '/posts'
		expect(page).to have_css("img[alt=Test]")
	end

end

describe 'creating posts' do

	before do
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@tes.com')
		fill_in('Password', with: 'testtest')
		fill_in('Password confirmation', with: 'testtest')
		click_button('Sign up')
	end

	it "Should only allow logged in users to post images" do
		visit '/'
		click_link 'Add a post'
		expect(page).to have_content 'Add a photo:'
	end


	it 'prompts user to fill out a form, then displays the new post' do
		visit '/posts'
		click_link 'Add a post'
		fill_in 'Title', with: 'Title'
		attach_file "Image", "#{Rails.root}/public/images/full-size/test.png"
		click_button 'Create Post'
		expect(page).to have_content 'Title'
		expect(page).to have_css("img[alt=Test]")
		expect(current_path).to eq '/posts'
	end

	it " should not allow users that are not logged in to post images" do
		visit '/'
		click_link 'Sign out'
		click_link 'Add a post'
		expect(page).to have_content 'Log in'
	end


end

context 'viewing posts' do

	before do
		@title = Post.create(title: 'Title', image: File.open("#{Rails.root}/public/images/full-size/test.png"))
	end


	it 'lets a user view a post by clicking title' do
		visit '/posts'
		click_link 'Title'
		expect(page).to have_content 'Title'
		expect(current_path).to eq "/posts/#{@title.id}"
	end

	it 'lets a user view a post by clicking on the image' do
		visit '/posts'
		click_link "img-#{@title.id}"
		expect(page).to have_css("img[alt=Test]")
		expect(current_path).to eq "/posts/#{@title.id}"
	end

end
	






