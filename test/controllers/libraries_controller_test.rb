require "test_helper"

class LibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @library = libraries(:one)
  end

  test "should get index" do
    get libraries_url
    assert_response :success
  end

  test "should get new" do
    get new_library_url
    assert_response :success
  end

  test "should create library" do
    assert_difference('Library.count') do
      post libraries_url, params: { library: { Book_Author: @library.Book_Author, Book_Id: @library.Book_Id, Book_Publisher: @library.Book_Publisher, Book_Title: @library.Book_Title, year: @library.year } }
    end

    assert_redirected_to library_url(Library.last)
  end

  test "should show library" do
    get library_url(@library)
    assert_response :success
  end

  test "should get edit" do
    get edit_library_url(@library)
    assert_response :success
  end

  test "should update library" do
    patch library_url(@library), params: { library: { Book_Author: @library.Book_Author, Book_Id: @library.Book_Id, Book_Publisher: @library.Book_Publisher, Book_Title: @library.Book_Title, year: @library.year } }
    assert_redirected_to library_url(@library)
  end

  test "should destroy library" do
    assert_difference('Library.count', -1) do
      delete library_url(@library)
    end

    assert_redirected_to libraries_url
  end
end
