class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :salt
      t.string :first_name
    end
    
    add_column :urls, :user_id, :integer
  end
end
