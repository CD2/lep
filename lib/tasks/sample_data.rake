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
      contact_name: Faker::Name.name,
      contact_role: Faker::Company.profession,
      contact_email: Faker::Internet.email,
      contact_phone: Faker::PhoneNumber.phone_number,
      logo: Faker::Company.logo,
      pledge_type_apprenticeships: i % 2 != 0,
      pledge_type_work_inspiration: i % 2 == 0 ,
      pledge_type_work_placements: i % 2 != 0 ,
      pledge_type_SEND_support: i % 2 == 0,
      pledge_type_other_information: Faker::Lorem.sentence
    })

  end



end