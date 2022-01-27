class CreateRaiders < ActiveRecord::Migration[7.0]
  def change
    create_table :raiders do |t|
      t.string :name
      t.boolean :active_ind

      t.timestamps
    end
  end
end
