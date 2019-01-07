class AddFieldsToEmployerForms < ActiveRecord::Migration[5.0]
  def change
    add_column :employer_forms, :pledge_type_apprenticeships, :boolean
    add_column :employer_forms, :pledge_type_work_inspiration, :boolean
    add_column :employer_forms, :pledge_type_work_placements, :boolean
    add_column :employer_forms, :pledge_type_SEND_support, :boolean
    add_column :employer_forms, :pledge_type_other_information, :string
  end
end
