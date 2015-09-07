class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :profession
      t.integer :age
      t.string :gender
      t.string :height
      t.string :education
      t.string :country
      t.string :city
      t.string :number_of_children
      t.string :integer
      t.string :bio
      t.string :image_url

      t.timestamps null: false
    end
  end
end
