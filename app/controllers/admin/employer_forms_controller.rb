class Admin::EmployerFormsController < ApplicationController

  layout 'admin_layout'

  before_action :authenticate_user!
  before_action :set_employer_form, only: [:show, :destroy]

  def index
    @employer_forms = EmployerForm.all
    respond_to do |format|
      format.html
      format.csv { send_data EmployerForm.to_csv, filename: "Youth-Pledge-Applications-#{Date.today}.csv" }
    end
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
