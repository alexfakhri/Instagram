require 'rails_helper'

describe 'commenting' do
  before do
    post = Post.create(title: 'Title')
  end

  it 'a user can comment, which should show the comment on the page' do
	  visit '/posts'
    click_link 'Title'
    click_link 'Comment'
    fill_in 'Comment', with: 'Awesome photo'
    click_button 'Post Comment'
    expect(page).to have_content("Awesome photo")
	end

end


