task reset_all: :environment do
  
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['seed'].invoke

end

task seed: :environment do
  
  Rake::Task['db:migrate'].invoke
  Rake::Task['seed_pages'].invoke
  Rake::Task['sample_data'].invoke

  User.create!(name: 'CD2', email: 'web@cd2solutions.co.uk', password: 'apprentice')

  User.create!(name: 'Michael Gray', email: 'Michael.Gray@suffolk.gov.uk', password: '7tmus3Xym6WE')
  User.create!(name: 'J Starling', email: 'j.starling@norfolk.gov.uk', password: 'WD6cj2AFR4Pb')
  User.create!(name: 'Paul Wright', email: 'paul.wright@norfolk.gov.uk', password: 'ZwV53V7x7caY')

end