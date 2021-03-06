class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.where(user_id: current_user.id)
  end

  def show
    @todo_list = todo_list
    @item = Item.new
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
    @todo_list = todo_list
  end

  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)

    if @todo_list.save
      redirect_to todo_list_path(@todo_list)
    else
      render 'new'
    end
  end

  def update
    @todo_list = todo_list

    if @todo_list.update(todo_list_params)
      redirect_to @todo_list
    else
      render 'edit'
    end
  end

  def destroy
    @todo_list = todo_list
    @todo_list.destroy

    redirect_to todo_lists_path
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end

  def todo_list
    current_user.todo_lists.find(params[:id])
  end

end
