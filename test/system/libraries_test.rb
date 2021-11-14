require "application_system_test_case"

class LibrariesTest < ApplicationSystemTestCase
  setup do
    @library = libraries(:one)
  end

  test "visiting the index" do
    visit libraries_url
    assert_selector "h1", text: "Libraries"
  end

  test "creating a Library" do
    visit libraries_url
    click_on "New Library"

    fill_in "Book author", with: @library.Book_Author
    fill_in "Book id", with: @library.Book_Id
    fill_in "Book publisher", with: @library.Book_Publisher
    fill_in "Book title", with: @library.Book_Title
    fill_in "Year", with: @library.year
    click_on "Create Library"

    assert_text "Library was successfully created"
    click_on "Back"
  end

  test "updating a Library" do
    visit libraries_url
    click_on "Edit", match: :first

    fill_in "Book author", with: @library.Book_Author
    fill_in "Book id", with: @library.Book_Id
    fill_in "Book publisher", with: @library.Book_Publisher
    fill_in "Book title", with: @library.Book_Title
    fill_in "Year", with: @library.year
    click_on "Update Library"

    assert_text "Library was successfully updated"
    click_on "Back"
  end

  test "destroying a Library" do
    visit libraries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Library was successfully destroyed"
  end
end
