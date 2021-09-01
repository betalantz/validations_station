class CreatePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :platforms do |t|
      t.integer :platform_num
      t.references :station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
