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
    pledge_type_apprenticeships
    pledge_type_work_inspiration
    pledge_type_work_placements
    pledge_type_SEND_support
    pledge_type_other_information
    contact_name
    contact_role
    contact_email
    contact_phone
    created_at
  ]

  def self.xlsx_head
    XLSX_COLUMNS.map(&:titleize)
  end
  
  def to_xlsx_row
    XLSX_COLUMNS.map{ |column| send(column) }
  end

end
