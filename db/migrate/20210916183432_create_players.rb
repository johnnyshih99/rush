class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :pos
      t.integer :att
      t.float :att_g
      t.float :yds
      t.float :avg
      t.float :yds_g
      t.integer :td
      t.string :lng
      t.integer :first
      t.float :first_p
      t.integer :twenty_plus
      t.integer :forty_plus
      t.integer :fum
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
