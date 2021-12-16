puts "🌱 Seeding stations..."
qc = Station.create(name: "Queen's Cross", city: "Brambury")
us = Station.create(name: "Union Station", city: "Upton Downs")

puts "🌱 Seeding trains..."
service = ["express", "local"]
t1 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)
t2 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)
t3 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)
t4 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)
t5 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)
t6 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)
t7 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)
t8 = Train.create(train_num: Faker::Number.decimal_part(digits: 3), service_type: service.sample, origin: Faker::Address.city, destination: Faker::Address.city)

puts "🌱 Seeding platforms..."
Station.all.each {|s|
    Faker::Number.within(range: 4..10).times {|i|
        Platform.create(platform_num: i+1, station: s)
    }
}

puts "🌱 Seeding assignments..."
p1 = Platform.first
Assignment.create(platform: p1, train: t1, arrival: "09:11", departure: "09:18")
Assignment.create(platform: p1, train: t2, arrival: "09:22", departure: "09:31")
Assignment.create(platform: p1, train: t3, arrival: "09:40", departure: "09:53")
Assignment.create(platform: p1, train: t4, arrival: "10:05", departure: "10:22")

puts "✅ Done seeding!"