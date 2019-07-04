class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.references :product, foreign_key: true
      t.string :stripe_id, null: false, default: ''
      t.integer :amount, null: false, default: 0
      t.integer :interval_count, null: false, default: 0
      t.string :currency, null: false, default: ''
      t.string :interval, null: false, default: ''
      t.string :nickname, null: false, default: ''
      t.string :usage_type, null: false, default: ''

      t.timestamps
    end
  end
end
