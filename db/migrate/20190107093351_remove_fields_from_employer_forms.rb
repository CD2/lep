class RemoveFieldsFromEmployerForms < ActiveRecord::Migration[5.0]
  def change
    remove_column :employer_forms, :number_of_employees, :string
    remove_column :employer_forms, :number_apprentices, :string
    remove_column :employer_forms, :proportion, :string
    remove_column :employer_forms, :future_number_apprentices, :string
    remove_column :employer_forms, :future_proportion, :string
    remove_column :employer_forms, :work_experience, :string
    remove_column :employer_forms, :future_work_experience, :string
    remove_column :employer_forms, :enterprise_adviser, :string
  end
end
