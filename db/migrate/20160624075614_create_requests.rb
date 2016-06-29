class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :request_status
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
