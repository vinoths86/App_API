class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :phone_no
      t.string :specialization

      t.timestamps
    end
  end
end
