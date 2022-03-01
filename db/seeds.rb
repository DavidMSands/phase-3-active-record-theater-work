puts "Seeding data..."

20.times do 
    role = Role.create(
       character_name: Faker::Name.name   
    )

    Audition.create(
        actor: Faker::Name.name,
        location: Faker::Address.city,
        phone: rand(1000000000..9999999999),
        hired: 0,
        role_id: role.id
    )
end

puts "Done seeding"