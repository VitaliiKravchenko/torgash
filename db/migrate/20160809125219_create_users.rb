class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :full_name
      t.string :birthday
      t.string :email
      t.string :country
      t.string :state
      t.string :city
      t.string :zip
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
