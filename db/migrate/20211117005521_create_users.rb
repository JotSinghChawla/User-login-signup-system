class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.date :dob
      t.bigint :mobile
      t.string :email
      t.string :hashed_password

      t.timestamps
    end
  end
end
