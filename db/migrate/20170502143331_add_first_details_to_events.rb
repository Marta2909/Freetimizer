class AddFirstDetailsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
    add_column :events, :address, :string
    add_column :events, :city, :string
    add_column :events, :is_paid, :boolean
  end
end
