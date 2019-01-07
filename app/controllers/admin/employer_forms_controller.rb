class Admin::EmployerFormsController < ApplicationController

  layout 'admin_layout'

  before_action :authenticate_user!
  before_action :set_employer_form, only: [:show, :destroy]

  def index
    @employer_forms = EmployerForm.all
    @xlsx_head = EmployerForm.xlsx_head
    respond_to do |format|
      format.html
      format.xlsx { filename =  "Youth-Pledge-Applications-#{Date.today}.xlsx" }
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
