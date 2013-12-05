class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :cut
      t.string :name
      t.timestamps
    end
    add_index :favorites, :cut_id
    add_index :favorites, :user_id
  end
end
