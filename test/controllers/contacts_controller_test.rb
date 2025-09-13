require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contacts_index_url
    assert_response :success
  end

  test "should get preview_email" do
    get contacts_preview_email_url
    assert_response :success
  end

  test "should get send_email" do
    get contacts_send_email_url
    assert_response :success
  end
end
