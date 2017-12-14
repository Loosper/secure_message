class CreateRsaKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :rsa_keys do |t|
      t.integer :n
      t.integer :e
      t.integer :d
      t.string :id

      t.timestamps
    end
  end
end
