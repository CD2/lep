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
    if @employer_form.save
      redirect_to submitted_url, notice: 'Employer form was successfully created.'
    else
      render :new
    end
  end


  private

    def employer_form_params
      params.require(:employer_form).permit(:name, :address_one, :address_two, :city, :county, :postcode, :sector, :number_of_employees, :contact_name, :contact_role, :contact_email, :contact_phone, :number_apprentices, :future_number_apprentices, :proportion, :future_proportion, :work_experience, :future_work_experience, :enterprise_adviser, :logo, :organisation_type)
    end
end
