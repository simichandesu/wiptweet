class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :twitter_url
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
