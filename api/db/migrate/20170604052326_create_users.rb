class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email
      t.integer :user_class, null: false
      t.string :rg
      t.string :cpf, null: false
      t.string :address, null: false
      t.string :cep, null: false
      t.string :phone
      t.date :birthday, null: false
      t.string :token
      t.string
      t.timestamps null: false
    end

    add_index :users, :username, unique: true
    add_index :users, :cpf, unique: true
  end
end
