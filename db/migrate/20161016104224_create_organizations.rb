class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :twitter_url
      t.text :feed_url
      t.float :latitude
      t.float :longitude
      t.datetime :latest_published

      t.timestamps null: false
    end
  end
end