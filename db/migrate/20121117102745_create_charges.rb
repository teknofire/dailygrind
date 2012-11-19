class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :user_id
      t.decimal :amount
      t.string :name

      t.timestamps
    end
  end
end
