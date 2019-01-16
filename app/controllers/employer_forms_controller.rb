class EmployerFormsController < ApplicationController
  before_action :set_employer_form, only: [:show, :edit, :update, :destroy]

  def index
    @employer_forms = EmployerForm.all
  end

  def new
    @employer_form = EmployerForm.new
  end

  def create
    @employer_form = EmployerForm.new(employer_form_params)
    if verify_recaptcha(model: @employer_form) && @employer_form.save
      redirect_to submitted_url, notice: 'Employer form was successfully created.'
    else
      render :new
    end
  end


  private

    def employer_form_params
      params.require(:employer_form).permit(
        :name,
        :address_one,
        :address_two,
        :city,
        :county,
        :postcode,
        :sector,
        :contact_name,
        :contact_role,
        :contact_email,
        :contact_phone,
        :support_type,
        :pledge_type_apprenticeships,
        :pledge_type_work_inspiration,
        :pledge_type_work_placements,
        :pledge_type_SEND_support,
        :pledge_type_other_information,
        :logo,
        :organisation_type
      )
    end

end
