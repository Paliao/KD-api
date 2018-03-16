namespace :dev do

  task setup: :environment do
    puts 'Setting up development environment...'
    %x(rails db:drop)
    %x(rails db:migrate)
    %x(rails dev:generate_data)
    puts 'Environment created'
  end

  task generate_data: :environment do 
    5.times do
      Category.create!(
        name: FFaker::Book.title,
        description: FFaker::Lorem.sentence,
        category_type: %w[Advertise Combo Establishment Event Product].sample
      )
    end
    
    5.times do 
      User.create!(
        provider: 'email',
        email: FFaker::Internet.email,
        password: 'senha123',
        first_name: FFaker::Name.name,
        last_name: FFaker::Name.last_name,
        cpf: FFaker::IdentificationBR.cpf,
        rg: FFaker::IdentificationBR.rg,
        image: FFaker::Avatar.image
      )
    end
  end
end
