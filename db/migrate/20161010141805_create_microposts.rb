class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.references :organization, index: true
      t.text :title
      t.text :url
      t.text :summary
      t.datetime :published

      t.timestamps null: false
      t.index [:organization_id, :created_at]
    end
  end
end
