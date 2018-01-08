class ItemsController < ApplicationController

  def create
    @todo_list = todo_list
    @item = todo_list.items.new(item_params.merge(is_done: false))
    if @item.save
      redirect_to todo_list_path(@todo_list)
    else
      render json: { errors: @item.errors }, status: 400
    end
  end

  def update
    @todo_list = todo_list
    @item = item
    unless @item.update(item_params)
      flash[:error] = 'Something went wrong please try updating again'
    end
    redirect_to todo_list_path(@todo_list)
  end

  def destroy
    @todo_list = todo_list
    @item = item
    @item.destroy

    redirect_to todo_list_path(@todo_list)
  end

  private

  def item_params
    params.require(:item).permit(:title, :is_done)
  end

  def todo_list
    current_user.todo_lists.find(params[:todo_list_id])
  end

  def item
    @todo_list.items.find(params[:id])
  end

end
