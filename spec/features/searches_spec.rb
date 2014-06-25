feature "searching" do

  before(:each) do
    category = FactoryGirl.create(:category, name: 'test category')
    target_ad = FactoryGirl.create(:post, title: 'car ad')
    desc_ad = FactoryGirl.create(:post, title: 'Honda Ad', description: "This is a car.")
    ignored_ad = FactoryGirl.create(:post, title: 'House Ad', description: "empty")
    titlecase_ad = FactoryGirl.create(:post, title: 'Car Ad', description: "empty")

    visit category_url(category)
    fill_in 'Keywords', with: 'car'
    click_button 'Search'
  end

  scenario "should show posts containing the keywords" do
    expect(page).to have_content 'car ad'
    expect(page).to have_content 'Honda Ad'
  end

  scenario "should not show posts without the keywords" do
    expect(page).not_to have_content 'House Ad'
  end
  
  scenario "should be case insensitive" do
    expect(page).to have_content 'Car Ad'
  end

end
