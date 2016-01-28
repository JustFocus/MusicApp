class CreateBand < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :name, null: false
      t.string :album_type, null: false

      t.timestamps
    end

    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :name, null: false
      t.string :track_type, null: false
      t.text :lyrics, null: false

      t.timestamps
    end
    add_index :albums, :band_id
    add_index :tracks, :album_id
  end
end
