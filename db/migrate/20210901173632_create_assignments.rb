class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.time :arrival
      t.time :departure
      t.references :platform, null: false, foreign_key: true
      t.references :train, null: false, foreign_key: true

      t.timestamps
    end
  end
end
