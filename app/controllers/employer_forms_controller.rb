class EmployerFormsController < ApplicationController
  before_action :set_employer_form, only: [:show, :edit, :update, :destroy]

  # GET /employer_forms
  # GET /employer_forms.json
  def index
    @employer_forms = EmployerForm.all
  end

  # GET /employer_forms/1
  # GET /employer_forms/1.json
  def show
  end

  # GET /employer_forms/new
  def new
    @employer_form = EmployerForm.new
  end

  # GET /employer_forms/1/edit
  def edit
  end

  # POST /employer_forms
  # POST /employer_forms.json
  def create
    @employer_form = EmployerForm.new(employer_form_params)

    respond_to do |format|
      if @employer_form.save
        format.html { redirect_to @employer_form, notice: 'Employer form was successfully created.' }
        format.json { render :show, status: :created, location: @employer_form }
      else
        format.html { render :new }
        format.json { render json: @employer_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employer_forms/1
  # PATCH/PUT /employer_forms/1.json
  def update
    respond_to do |format|
      if @employer_form.update(employer_form_params)
        format.html { redirect_to @employer_form, notice: 'Employer form was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer_form }
      else
        format.html { render :edit }
        format.json { render json: @employer_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employer_forms/1
  # DELETE /employer_forms/1.json
  def destroy
    @employer_form.destroy
    respond_to do |format|
      format.html { redirect_to employer_forms_url, notice: 'Employer form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer_form
      @employer_form = EmployerForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_form_params
      params.require(:employer_form).permit(:name, :address_one, :address_two, :city, :county, :postcode, :sector, :number_of_employees, :contact_name, :contact_role, :contact_email, :contact_phone, :number_apprentices, :future_number_apprentices, :proportion, :future_proportion, :work_experience, :future_work_experience, :enterprise_adviser)
    end
end
