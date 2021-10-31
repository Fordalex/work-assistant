class AddTechnical < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :technical, :text
  end
end
