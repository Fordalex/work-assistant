class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :start_time
      t.integer :duration

      t.timestamps
    end
  end
end
