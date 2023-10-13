class CreateTestTables < ActiveRecord::Migration::Current
  def change
    create_table :items do |t|
      t.timestamps
    end
  end
end
