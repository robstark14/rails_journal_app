require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @category = Category.create(name: "Work Stuff", description: "Just some work related stuff, nothing fancy.")
  end

  test "1.1 Should be able to create a category" do
    category = Category.new
    category.name = 'School Stuff'
    category.description = 'just some web development related stuff'
    assert category.save, "Created a new category"
  end

  test "1.2 Should be able to reject a category with empty name" do
    category = Category.new
    category.name = ''
    category.description = 'just some web development related stuff'
    assert_not category.save, "Created a category with an empty name."
  end

  test "1.3 Should be able to reject a category with name longer than 20 chars" do
    category = Category.new
    category.name = 'School stuffffffffffffffffffffffffffffffffffffffssss'
    category.description = 'just some web development related stuff'
    assert_not category.save, "Created a category name with more than 20 chars."
  end

  test "1.4 Should be able to reject a category with empty description" do
    category = Category.new
    category.name = 'School stuff'
    category.description = ''
    assert_not category.save, "Created a category with an empty description."
  end

  test "1.5 Should be able to reject a category with description shorter than 10 chars" do
    category = Category.new
    category.name = 'School stuff'
    category.description = 'just so'
    assert_not category.save, "Created a category description less than 10 characters"
  end

  test "1.6 Should be able to reject a category with description greater than 100 chars" do
    category = Category.new
    category.name = 'School stuff'
    category.description = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.'
    assert_not category.save, "Created a category with description greater than 100 characters"
  end

  test "3.1 Should be able to update a category" do
    @category.name = "School stuff 2"
    @category.description = 'just some web development related stuff'
    assert @category.save, "Updated a category name"
  end

  test "3.2 Should be able to reject a category update for empty name" do
    @category.name = ""
    @category.description = 'just some web development related stuff'
    assert_not @category.save, "Updated with an empty name"
  end

  test "3.3 Should be able to reject a category update for name chars greater than 20" do
    @category.name = 'School stuffffffffffffffffffffffffffffffffffffffssss2'
    @category.description = 'just some web development related stuff'
    assert_not @category.save, "Updated with name characters greater than 20"
  end

  test "3.4 Should be able to reject a category update for empty description" do
    @category.name = 'School stuff 2'
    @category.description = ''
    assert_not @category.save, "Updated with an empty description"
  end

  test "3.5 Should be able to reject a category update for description shorter than 10 chars" do
    @category.name = 'School stuff 2'
    @category.description = 'just so'
    assert_not @category.save, "Updated with description shorter than 10 chars"
  end

  test "3.6 Should be able to reject a category update for empty description greater than 100 chars" do
    @category.name = "2nd revision"
    @category.description = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.'
    assert_not @category.save, "Updated with description shorter than 10 chars"
  end
end
