class CreateCuts < ActiveRecord::Migration
  def change
    create_table :cuts do |t|
      t.string :name
      t.references :primal_cut
      t.references :animal

      t.timestamps
    end
    add_index :cuts, :primal_cut_id
    add_index :cuts, :animal_id
    add_index :cuts, :favorite_id
  end
end
