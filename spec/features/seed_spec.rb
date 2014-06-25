feature "seed data" do
  it "should be generated" do
    category = Category.find_by(name: 'test category')
    expect(category).not_to be_nil
  end
end
