require "application_system_test_case"

class WhateverChatsTest < ApplicationSystemTestCase
  setup do
    @whatever_chat = whatever_chats(:one)
  end

  test "visiting the index" do
    visit whatever_chats_url
    assert_selector "h1", text: "Whatever Chats"
  end

  test "creating a Whatever chat" do
    visit whatever_chats_url
    click_on "New Whatever Chat"

    click_on "Create Whatever chat"

    assert_text "Whatever chat was successfully created"
    click_on "Back"
  end

  test "updating a Whatever chat" do
    visit whatever_chats_url
    click_on "Edit", match: :first

    click_on "Update Whatever chat"

    assert_text "Whatever chat was successfully updated"
    click_on "Back"
  end

  test "destroying a Whatever chat" do
    visit whatever_chats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Whatever chat was successfully destroyed"
  end
end
