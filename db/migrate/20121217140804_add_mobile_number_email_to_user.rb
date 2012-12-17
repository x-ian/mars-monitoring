class AddMobileNumberEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :mobile_number, :string
  end
end
