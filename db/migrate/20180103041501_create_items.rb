class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.boolean :is_done
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
