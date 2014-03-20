class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.string :src
      t.integer :tag_id

      t.timestamps
    end
  end
end
