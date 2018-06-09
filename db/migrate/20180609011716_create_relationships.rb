class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :frame, foreign_key: true

      t.timestamps
      
      t.index [ :user_id, :frame_id, :type ], unique: true
    end
  end
end
