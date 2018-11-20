require './test/test_helper'

class BlogTest < CapybaraTestCase
  def test_user_can_navigate_to_blog
    visit '/'
    click_on "Blog"
    
    assert_equal 200, page.status_code
    assert_equal '/blog', current_path
    assert page.has_content?("Blog")
  end
  
end