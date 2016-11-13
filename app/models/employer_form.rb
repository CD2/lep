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

end
