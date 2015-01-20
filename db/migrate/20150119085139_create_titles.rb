class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
