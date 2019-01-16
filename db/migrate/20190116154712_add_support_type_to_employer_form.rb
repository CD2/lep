class AddSupportTypeToEmployerForm < ActiveRecord::Migration[5.0]
  def change
    add_column :employer_forms, :support_type, :string
  end
end
