class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :name,               null: false
      t.text       :text,               null: false
      t.integer    :category_id,        null: false
      t.integer    :situation_id,       null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefectures_id,     null: false
      t.integer    :delivery_day_id,    null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
