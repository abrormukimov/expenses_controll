class CreateGroupExpenses < ActiveRecord::Migration[6.0]
    def change
      create_table :group_expenses do |t|
  
        t.timestamps
      end
    end
  end