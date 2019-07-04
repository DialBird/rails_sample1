class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ''
      t.string :type, null: false, default: ''

      t.timestamps
    end
  end
end
