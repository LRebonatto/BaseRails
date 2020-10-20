class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.integer  :galeria_id,              :null => false
      t.integer  :capa,                    :null => false, :default => 0
      t.integer  :deleted,                 :null => false, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end