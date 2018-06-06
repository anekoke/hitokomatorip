class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.string :name
      t.text :content
      t.float :latitude
      t.float :longitude
      t.string :image

      t.timestamps
    end
  end
end
