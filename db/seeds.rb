10.times do
  FactoryGirl.create(:post)
end

FactoryGirl.create(:user, email: "guest@example.com", password: "guestpassword")
