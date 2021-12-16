class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :trains do |t|
      t.string :train_num
      t.string :service_type
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end
