namespace :dev do
  desc "Configura o ambiente de desenvolvimento."
  task setup: :environment do
    puts "Cadastrando tipos..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        descrition: kind
      )
    end
    puts "... tipos cadastrados com sucesso."

    puts "Cadastrando contatos..."
    100.times do |i|
      Contact.create!(
        name:Faker::Name.name,
        email:Faker::Internet.email,
        birthdate:Faker::Date.between(from: 60.years.ago, to: 18.years.ago),
        kind:Kind.all.sample
      )
    end
    puts "... contatos cadastrados com sucesso."
  end

end
