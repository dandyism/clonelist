require "posting_helper"

feature "posting an advertisement" do
  scenario "requires login" do
    visit new_post_url
    expect(page).to have_content "Sign in"
  end
end
