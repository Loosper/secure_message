class CreateRsaKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :rsa_keys do |t|
      t.bigint :n
      t.bigint :e
      t.bigint :d
      t.string :uid

      t.timestamps
    end
  end
end
