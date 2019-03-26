class CreateUsersAndChirps < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :location_id, null: false
      t.timestamps
    end
    create_table :chirps do |t|
      t.string :body, null: false
      t.integer :authr_id, null: false
      t.timestamps
    end
  end
end
