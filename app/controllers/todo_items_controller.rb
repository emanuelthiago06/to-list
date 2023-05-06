class TodoItemsController < ApplicationController
    before_action :set_todo_list

    def create
        @todo_item = @todo_list.todo_items.create(todo_item_params)
        redirect_to @todo_list
    end

    def destroy
        @todo_item = @todo_list.todo_items.find(params[:id])
        @todo_item.destroy
        if @todo_item.destroy
            flash[:sucess] = "Todo List item was deleted"
        else
            flash[:error] = "Todo List item could not be deleted"
        end
        redirect_to @todo_list
    end

    def complete
        @todo_item = @todo_list.todo_items.find(params[:id])
        @todo_item.update_attribute(:completed_at, Time.now)
        
        redirect_to @todo_list
    end

    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_item_params
        params[:todo_item].permit(:content)
    end

end
