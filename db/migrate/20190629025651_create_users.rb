class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: '', index: true
      t.string :provider, null: false, default: ''
      t.string :uid, null: false, default: '', index: true

      t.timestamps
    end
  end
end
