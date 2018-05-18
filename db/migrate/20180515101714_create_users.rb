class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :auth_token
      t.datetime :oauth_expires_at
      t.string :email
      t.string :password
      t.string :firstname
      t.string :lastname
      t.timestamps
    end
  end
end
