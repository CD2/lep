class EmployerForm < ApplicationRecord

  validates :terms, acceptance: true

  mount_uploader :logo, LogoUploader

end
