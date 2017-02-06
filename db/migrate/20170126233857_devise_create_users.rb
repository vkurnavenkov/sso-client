class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :doorkeeper_uid
      t.string :doorkeeper_access_token
      t.string :email

      t.timestamps null: false
    end
  end
end
