json.array!(@employer_forms) do |employer_form|
  json.extract! employer_form, :id, :name, :address_one, :address_two, :city, :county, :postcode, :sector, :number_of_employees, :contact_name, :contact_role, :contact_email, :contact_phone, :number_apprentices, :future_number_apprentices, :proportion, :future_proportion, :work_experience, :future_work_experience, :enterprise_adviser
  json.url employer_form_url(employer_form, format: :json)
end
