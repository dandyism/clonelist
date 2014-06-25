require "posting_helper"

feature "posting an advertisement" do
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
