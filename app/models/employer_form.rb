class EmployerForm < ApplicationRecord

  validates :terms, acceptance: true

  mount_uploader :logo, LogoUploader

  def self.organisation_type
    [
      'Limited Company', 'Charity', 'Social Enterprise', 'Public Sector', 'Other'
    ]
  end

  def self.employment_sector
    [
      "Construction",
      "Culture",
      "Energy",
      "Engineering",
      "Food, drink and agriculture",
      "Financial Services",
      "ICT and Digital Creative",
      "Ports and logistics",
      "Tourism",
      "Life sciences",
      "Health and social care",
      "Hospitality",
      "Retail",
      "Agritech",
      "Other"
    ]
  end

  XLSX_COLUMNS = %w[
    name
    address_one
    address_two
    city
    county
    postcode
    sector
    number_of_employees
    contact_name
    contact_role
    contact_email
    contact_phone
    number_apprentices
    future_number_apprentices
    proportion
    future_proportion
    work_experience
    future_work_experience
    enterprise_adviser
    created_at
  ]

  def self.xlsx_head
    XLSX_COLUMNS.map(&:titleize)
  end
  
  def to_xlsx_row
    XLSX_COLUMNS.map{ |column| send(column) }
  end

end
