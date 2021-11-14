class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.string :Book_Id
      t.string :Book_Title
      t.string :Book_Author
      t.string :Book_Publisher
      t.date :year

      t.timestamps
    end
  end
end
