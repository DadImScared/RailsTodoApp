require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  setup do
    @user = create(:user)
  end

  test 'should not save todo list without title' do
    todo_list = TodoList.new(user: @user)
    assert_not todo_list.save
  end

  test 'should not save todo list without user' do
    todo_list = TodoList.new(title: 'taco')
    assert_not todo_list.save
  end
end
