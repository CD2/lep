class CreateEmployerForms < ActiveRecord::Migration[5.0]
  def change
    create_table :employer_forms do |t|
      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :county
      t.string :postcode
      t.string :sector
      t.integer :number_of_employees
      t.string :contact_name
      t.string :contact_role
      t.string :contact_email
      t.string :contact_phone
      t.integer :number_apprentices
      t.integer :future_number_apprentices
      t.string :proportion
      t.string :future_proportion
      t.integer :work_experience
      t.integer :future_work_experience
      t.integer :enterprise_adviser

      t.timestamps
    end
  end
end
