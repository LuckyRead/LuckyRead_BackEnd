class AddAllFk < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_keys.sql"))
  end
end
