require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include FactoryBot::Syntax::Methods

  setup do
    @user = create(:user_with_todos_items)
    @todo_list = @user.todo_lists.all[0]
    @item = @todo_list.items.all[0]
    sign_in @user
  end

  test 'can create todo item' do
    assert_difference('Item.count') do
      post todo_list_items_url(todo_list_id: @todo_list),
           params: { item: { title: 'taco' } }

    end
    assert_redirected_to todo_list_path(@todo_list)
  end

  test 'can edit todo item' do
    patch todo_list_item_url(@todo_list, @item),
          params: { item: { is_done: true } }
    @item.reload
    assert_equal(@item.is_done, true)
  end

  test 'can delete todo item' do
    assert_difference('Item.count', -1) do
      delete todo_list_item_url(@todo_list, @item)
    end
    assert_redirected_to todo_list_path(@todo_list)
  end
end
