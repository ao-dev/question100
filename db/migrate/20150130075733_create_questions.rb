class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :title_id
      t.string :content
      t.boolean :status

      t.timestamps
    end
  end
end
