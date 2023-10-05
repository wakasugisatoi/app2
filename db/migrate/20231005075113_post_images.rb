class PostImages < ActiveRecord::Migration[6.1]
  def change
    
  create_table :post_images do |t|
  t.string :shop_name
  t.text :caption
  t.integer :user_id
  t.timestamps null: false
    end
  end
end
