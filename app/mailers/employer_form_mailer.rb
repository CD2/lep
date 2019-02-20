class EmployerFormMailer < ApplicationMailer
  def sendMail(employerForm)

    @title = 'A new employer has submitted an application'
    @email = 'skills@newanglia.co.uk'
    @employerForm = employerForm

    mail subject: 'New Employer Application', to: @email
  end
end
