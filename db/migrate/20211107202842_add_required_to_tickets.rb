class AddRequiredToTickets < ActiveRecord::Migration[6.1]
  def change
    change_column :tickets, :description, :text, null: false
    change_column :tickets, :start_time, :time, null: false
    change_column :tickets, :duration, :integer, null: false
    change_column :tickets, :category_id, :bigint, null: false
  end
end
