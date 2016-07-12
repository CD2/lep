class EmployerForm < ApplicationRecord

  validates :terms, acceptance: true

end
