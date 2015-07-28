class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :title
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
