class AddCategoryToTicket < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :category
    add_reference :tickets, :subject_group
  end
end
