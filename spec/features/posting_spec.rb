require "posting_helper"

feature "posting an advertisement" do
  before(:each) do
    category = FactoryGirl.create(:category, name: 'test category')
    ad = FactoryGirl.create(:post, title: 'test ad', category: category)
  end

  scenario "requires login" do
    visit new_post_url
    expect(page).to have_content "Sign in"
  end

  scenario "should work when logged in" do
    visit new_user_registration_url
    fill_in_signup_form
    click_button 'Sign up'
    visit new_post_url
    fill_in_post_form
    click_button 'Post'
    expect(page).to have_content 'Success'
  end
end
