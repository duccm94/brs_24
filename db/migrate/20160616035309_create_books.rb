class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :publish_date
      t.integer :rating, default: 0
      t.string :author
      t.integer :number_pages
      t.string :picture
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
