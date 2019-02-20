class EmployerFormMailer < ApplicationMailer
  def sendMail(employerForm)

    @title = 'A new employer form has been submitted'
    @email = 'skills@newanglia.co.uk'
    @employerForm = employerForm

    mail subject: 'New Employer Form Submission', to: @email
  end
end
