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

  require 'csv'
  def self.to_csv
    # columns = EmployerForm.columns.map{|c| c.name, c.contact_email, c.created_at}
    columns = %w(name contact_email created_at)
    CSV.generate(headers: true) do |csv|
      csv << [''] + columns.map(&:titleize)

      all.each_with_index do |emp, i|
        csv << [i+1] + columns.map{ |attr| emp.send(attr) }
      end
    end

  end

end
