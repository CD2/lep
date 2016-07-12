task sample_data: :environment do
  
  Faker::Config.locale = 'en'

  30.times do |i|
    puts "#{i}/30"
    EmployerForm.create!({
      name: Faker::Company.name,
      address_one: Faker::Address.street_address,
      address_two: Faker::Address.secondary_address,
      city: Faker::Address.city,
      county: Faker::Address.state,
      postcode: Faker::Address.postcode,
      sector: Faker::Company.profession,
      number_of_employees: Faker::Number.between(5, 100),
      contact_name: Faker::Name.name,
      contact_role: Faker::Company.profession,
      contact_email: Faker::Internet.email,
      contact_phone: Faker::PhoneNumber.phone_number,
      number_apprentices: Faker::Number.between(0,10),
      future_number_apprentices: Faker::Number.between(5,20),
      work_experience: Faker::Number.between(0,10),
      future_work_experience: Faker::Number.between(10,30),
      enterprise_adviser: Faker::Number.between(4,15),
      logo: Faker::Company.logo
    })

  end



end