class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :text
      t.datetime :end

      t.timestamps
    end
  end
end
