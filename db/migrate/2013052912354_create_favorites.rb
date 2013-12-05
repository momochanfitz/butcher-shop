class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :cut_id
      t.string :user_id
      t.string :animal_id

      t.timestamps
    end
  end
end
