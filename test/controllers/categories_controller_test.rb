require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { description: "Some web development school stuff", name: "School stuff" } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { description: "Some web development school stuff", name: "School stuff" } }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

  test "should reject update category with an empty name" do
    patch category_url(@category), params: { category: {description: "Some web development school stuff", name: ""}}
    assert_response :unprocessable_entity
  end

  test "should reject update category with a name greater than 20 chars" do
    patch category_url(@category), params: { category: {description: "Some web development school stuff", name: "School stuffsssssssssssssssssssssssssssssss"}}
    assert_response :unprocessable_entity
  end

  test "should reject update category with an empty description" do
    patch category_url(@category), params: { category: {description: "", name: "School stuff"}}
    assert_response :unprocessable_entity
  end

  test "should reject update category with a description greater than 100 chars" do
    patch category_url(@category), params: { category: {description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.', name: "School stuff"}}
    assert_response :unprocessable_entity
  end

  test "should reject update category with a description less than 10 chars" do
    patch category_url(@category), params: { category: {description: "School", name: "School stuff"}}
    assert_response :unprocessable_entity
  end
  
end
