class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :commenter_id

      t.timestamps null: false
    end

    add_index :comments, :commentable_id
    add_index :comments, :commenter_id

  end
end
