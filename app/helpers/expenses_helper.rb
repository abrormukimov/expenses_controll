module ExpensesHelper
  def add_remove(object, expense)
    if object == @ungrouped
      button_to 'Add to this Group', group_expenses_path(expense_id: expense.id, group_id: @group.id),
                method: :post,
                class: 'btn btn-success btn-block'
    elsif object == @grouped
      button_to 'Remove from this Group', group_expense_path(expense_id: expense.id, group_id: @group.id),
                method: :delete,
                data: { confirm: 'Are you sure?' },
                class: 'btn btn-danger btn-block'
    end
  end

  def expense_img(expense)
    if expense.groups.first.nil?
      nil
    elsif expense.groups.first.icon.url.nil?
      'https://cdn4.iconfinder.com/data/icons/people-std-pack/512/customers-512.png'
    elsif expense.groups.first.icon.url
      expense.groups.first.icon.url
    end
  end

  def add_exp_img(expense)
    if expense.groups.first.nil?
      ''
    else
      image_tag expense_img(expense), class: 'exp-img'
    end
  end
end
