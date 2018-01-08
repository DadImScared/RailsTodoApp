require 'test_helper'

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include FactoryBot::Syntax::Methods

  setup do
    @user = create(:user_with_todos_items)
    @todo_list = @user.todo_lists.all[0]
    sign_in @user
  end

  test 'should get index' do
    get todo_lists_url
    assert_response :success
    assert_select 'ul.list-group' do
      assert_select 'li.list-group-item', @user.todo_lists.all.count
      assert_select 'li.list-group-item' do |elements|
        elements.each_with_index do |li, index|
          assert_select li,
                        'span.todo-title',
                        "name: #{@user.todo_lists.all[index].title}"
          assert_select li, 'div.btn-group' do
            assert_select 'a.btn-primary[href=?]',
                          "/todo_lists/#{@user.todo_lists.all[index].id}/edit",
                          'Edit todo'
            assert_select 'a.btn-danger[href=?]',
                          "/todo_lists/#{@user.todo_lists.all[index].id}",
                          'Delete todo'
          end
        end
      end
    end
  end

  test 'can create a todo list' do
    assert_difference('TodoList.count') do
      post todo_lists_url,
           params: { todo_list: { title: 'first list' } }
    end
    assert_redirected_to todo_list_path(TodoList.last)
    follow_redirect!
    assert_select 'span.mx-lg-auto', 'first list'
    assert_response :success
  end

  test 'can not create todo list with no title' do
    assert_no_changes('TodoList.count') do
      post todo_lists_url,
           params: { todo_list: { title: '' } }
    end
    assert_select '.field_with_errors'
  end

  test 'can update a todo list' do
    patch todo_list_url(@todo_list),
          params: { todo_list: { title: 'taco' } }
    assert_redirected_to todo_list_path(@todo_list)
    @todo_list.reload
    assert_equal 'taco', @todo_list.title
  end

  test 'can delete a todo list' do
    assert_difference('TodoList.count', -1) do
      delete todo_list_url(@todo_list)
    end

    assert_redirected_to todo_lists_path
  end

  test 'should get show' do
    get todo_list_path(@todo_list)
    assert_response :success
    assert_select 'ul.list-group' do
      assert_select 'li.list-group-item', @todo_list.items.count
      assert_select 'li.list-group-item' do |elements|
        elements.each_with_index do |li, index|
          assert_select li,
                        'div.item-title',
                        @todo_list.items.all[index].title
          assert_select 'div.btn-group' do
            assert_select 'a.btn-primary[href=?]',
                          "/todo_lists/#{@todo_list.id}" \
                          "/items/#{@todo_list.items.all[index].id}",
                          'mark as done'
          end
        end
      end
    end
  end

  test 'should get new' do
    get new_todo_list_url
    assert_select 'form'
    assert_response :success
  end

  test 'should get edit' do
    get edit_todo_list_url(@todo_list)
    assert_select 'form' do
      assert_select 'div.form-group' do
        assert_select 'input.form-control[value=?]',
                      @todo_list.title
      end
    end
    assert_response :success
  end

end
