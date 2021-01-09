class CreateExpenses < ActiveRecord::Migration[6.0]
    def change
      create_table :expenses do |t|
        t.text :name
        t.float :amount
        t.date :createdAt
  
        t.timestamps
      end
    end
  end