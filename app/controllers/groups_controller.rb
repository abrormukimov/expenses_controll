class GroupsController < ApplicationController
  before_action :set_group_item, only: %i[edit update destroy show]
  layout 'group'

  def index
    @groups = current_user.groups.by_alpha_order.page(params[:page]).per(3)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_path, notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Group was Removed' }
    end
  end

  def show
    @group = Group.find(params[:id])
    @grouped = @group.expenses.order('expenses.created_at desc').page(params[:page]).per(3)
    @ungrouped = Expense.external(current_user).by_user(current_user).by_recent_created.page(params[:page]).per(3)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def set_group_item
    @group = Group.find(params[:id])
  end
end
