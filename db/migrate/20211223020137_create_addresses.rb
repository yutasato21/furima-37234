class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post,           null: false
      t.integer    :prefectures_id, null: false
      t.string     :municipalities, null: false
      t.integer    :number,         null: false
      t.string     :building
      t.string     :telephone,      null: false
      t.references :purchase,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
