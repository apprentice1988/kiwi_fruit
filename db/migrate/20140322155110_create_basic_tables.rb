class CreateBasicTables < ActiveRecord::Migration
  def up
    drop_table :tags
    drop_table :videos
    create_table :videos do |t|
      t.string :qiniu_urls, array: true, default: []
      t.string :title
      t.string :thumbnail_small
      t.string :thumbnail_medium
      t.string :thumbnail_large
      t.integer :user_id
      t.boolean :is_published, :default=>false
      t.integer :industry_id
      t.integer :video_extension_id
    end
    add_index :videos, :user_id
    add_index :videos, :industry_id
    add_index :videos, :video_extension_id

    create_table :video_extensions do |t|
      t.string :title
      t.string :ori_thumbnail_small
      t.string :ori_thumbnail_medium
      t.string :ori_thumbnail_large
      t.string :ori_url
      t.string :provider
      t.integer :duration
      t.text :dl_urls, array: true, default: []
      t.text :description
      t.string :keywords
      t.string :embed_url
      t.boolean :is_available
      t.datetime :date
    end

    create_table :users do |t|
      t.string :email
      t.string :avatar
      t.string :name
      t.string :password_digest
      t.string :remember_token
      t.boolean :is_admin,  :default => false
    end

    create_table :industries do |t|
      t.string :name
      t.integer :videos_count, :default=>0
    end

    create_table :captions do |t|
      t.integer :video_id
      t.text :content
      t.integer :manuscripts_count, :default=>0
    end
    add_index :captions, :video_id

    create_table :manuscripts do |t|
      t.integer :user_id
      t.integer :caption_id
    end
    add_index :manuscripts, :user_id
    add_index :manuscripts, :caption_id
  end

  def down
    drop_table :manuscripts
    drop_table :captions
    drop_table :industries
    drop_table :users
    drop_table :video_extensions
    drop_table :videos
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.string :src
      t.integer :tag_id

      t.timestamps
    end
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
