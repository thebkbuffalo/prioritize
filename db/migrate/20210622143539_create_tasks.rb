class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
