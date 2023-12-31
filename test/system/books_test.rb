require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    login_as users(:dario)
    @book = Book.ordered.first 
  end

  test "Showing a book" do
    visit books_path
    click_link @book.title

    assert_selector "h1", text: @book.title
  end

  test "Creating a new book" do
    visit books_path
    assert_selector "h1", text: "Books"

    click_on "New book"
    fill_in "Title", with: "Capybara book"
    fill_in "Authors", with: "Capybara pirate"

    assert_selector "h1", text: "Books"
    click_on "Create book"

    assert_selector "h1", text: "Books"
    assert_text "Capybara book"
  end

  test "Updating a book" do
    visit books_path
    assert_selector "h1", text: "Books"

    click_on "Edit", match: :first
    fill_in "Title", with: "Updated book"

    assert_selector "h1", text: "Books"
    click_on "Update book"

    assert_selector "h1", text: "Books"
    assert_text "Updated book"
  end

  test "Destroying a book" do
    visit books_path
    assert_text @book.title

    click_on "Delete", match: :first
    assert_no_text @book.title
  end
end
