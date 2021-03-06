require './test/test_helper'

class HomepageTest < CapybaraTestCase
  def test_user_can_see_the_homepage
    visit '/'
    
    assert page.has_content?("Anna Smolentzov")
    assert_equal 200, page.status_code
  end
  
  def test_user_sees_message_if_page_doesnt_exists
    visit '/easteregg'
    
    assert page.has_content?("Page not found.")
    assert_equal 404, page.status_code
  end
  
  def test_user_can_see_blog_page
    visit '/blog'
  
    assert page.has_content?("Blog")
    assert_equal 200, page.status_code
  end
  
  def test_user_can_see_about_page
    visit '/about'
    
    assert page.has_content?("About Me!")
    assert_equal 200, page.status_code
  end
end