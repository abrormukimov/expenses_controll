class DropTable < ActiveRecord::Migration[6.0]
    def up
        drop_table(:campaigns, if_exists: true)
  end
end 