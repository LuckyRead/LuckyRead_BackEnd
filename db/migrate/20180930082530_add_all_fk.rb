class AddAllFk < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key1.sql"))
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key2.sql"))
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key3.sql"))
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key4.sql"))
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key5.sql"))
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key6.sql"))
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key7.sql"))
    ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key8.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key9.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key10.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key11.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key12.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key13.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key14.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key15.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key16.sql"))
    #ActiveRecord::Base.connection.execute(IO.read("/home/daniel/LuckyRead_BackEnd/db/MySQL_scripts/add_foreign_key17.sql"))
  end
end
