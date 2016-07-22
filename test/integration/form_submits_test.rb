require 'test_helper'

class FormSubmitsTest < ActionDispatch::IntegrationTest

  test 'form submits and creates cirrect data' do
    get '/'
    assert_select 'form#new_employer_form', 1

    #gen params
    params = {
      employer_form: {
        name: 'Name',
        address_one: 'address_one',
        address_two: 'address_two',
        city: 'city',
        county: 'county',
        postcode: 'postcode',
        sector: 'sector',
        number_of_employees: 'number_of_employees',
        contact_name: 'contact_name',
        contact_role: 'contact_role',
        contact_email: 'uniquie@email.com',
        contact_phone: 'contact_phone',
        number_apprentices: 'number_apprentices',
        future_number_apprentices: 'future_number_apprentices',
        proportion: 'proportion',
        future_proportion: 'future_proportion',
        work_experience: 'work_experience',
        future_work_experience: 'future_work_experience',
        enterprise_adviser: 'enterprise_adviser',
        logo: 'logo'
      }
    }


    assert_difference 'EmployerForm.count', 1 do
      post '/employer_forms', params: params
      assert_response 302
    end

    get '/admin/employer_forms'
    assert_response 302
    login(users(:admin))
    get '/admin/grant_details'
    assert_response 200

    assert_select 'td', text: user_params[:email]
  end

end
