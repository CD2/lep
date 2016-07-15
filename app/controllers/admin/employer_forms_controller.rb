class Admin::EmployerFormsController < ApplicationController

  layout 'admin_layout'

  before_action :set_employer_form, only: [:show, :destroy]

  def index
    @employer_forms = EmployerForm.all
  end

  def show
  end

  def destroy
    @employer_form.destroy
    redirect_to admin_employer_forms_path
  end


private

  def set_employer_form
    @employer_form = EmployerForm.find(params[:id])
  end
end
