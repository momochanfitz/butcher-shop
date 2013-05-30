class CreatePrimalCuts < ActiveRecord::Migration
  def change
    create_table :primal_cuts do |t|
      t.string :name
      t.references :animal

      t.timestamps
    end
    add_index :primal_cuts, :animal_id
  end
end
