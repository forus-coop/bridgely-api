class AddAlwaysRespondToEmployee < ActiveRecord::Migration
  def change
    add_column :v1_employees, :always_respond, :boolean
  end
end
