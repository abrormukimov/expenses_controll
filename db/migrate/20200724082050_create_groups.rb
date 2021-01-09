class CreateGroups < ActiveRecord::Migration[6.0]
    def change
      create_table :groups do |t|
        t.text :name
        t.float :icon
  
        t.timestamps
      end
    end
  end 