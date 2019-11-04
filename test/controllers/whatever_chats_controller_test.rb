require 'test_helper'

class WhateverChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @whatever_chat = whatever_chats(:one)
  end

  test "should get index" do
    get whatever_chats_url
    assert_response :success
  end

  test "should get new" do
    get new_whatever_chat_url
    assert_response :success
  end

  test "should create whatever_chat" do
    assert_difference('WhateverChat.count') do
      post whatever_chats_url, params: { whatever_chat: {  } }
    end

    assert_redirected_to whatever_chat_url(WhateverChat.last)
  end

  test "should show whatever_chat" do
    get whatever_chat_url(@whatever_chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_whatever_chat_url(@whatever_chat)
    assert_response :success
  end

  test "should update whatever_chat" do
    patch whatever_chat_url(@whatever_chat), params: { whatever_chat: {  } }
    assert_redirected_to whatever_chat_url(@whatever_chat)
  end

  test "should destroy whatever_chat" do
    assert_difference('WhateverChat.count', -1) do
      delete whatever_chat_url(@whatever_chat)
    end

    assert_redirected_to whatever_chats_url
  end
end
