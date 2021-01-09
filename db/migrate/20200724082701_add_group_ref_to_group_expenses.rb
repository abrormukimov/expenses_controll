class AddGroupRefToGroupExpenses < ActiveRecord::Migration[6.0]
    def change
      add_reference :group_expenses, :group, null: false, foreign_key: true
    end
  end 