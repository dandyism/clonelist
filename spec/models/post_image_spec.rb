require 'rails_helper'

RSpec.describe PostImage, :type => :model do
  it "should have an attached file" do
    should have_attached_file(:file)
  end

  it "should validate attachment presence" do
    should validate_attachment_presence(:file)
  end

  it "should validate attachment type" do
    should validate_attachment_content_type(:file)
      .allowing('image/png', 'image/gif')
      .rejecting('text/plain', 'text/xml')
  end

  it "should validate attachment size" do
    should validate_attachment_size(:file)
      .in(0..204.kilobytes)
  end
end
