User.destroy_all
Event.destroy_all
Attendance.destroy_all
User.reset_pk_sequence
Event.reset_pk_sequence
Attendance.reset_pk_sequence

10.times do
  User.create(first_name: Faker::Name.first_name, 
              last_name: Faker::Name.last_name, 
              description: Faker::Lorem.paragraph(sentence_count: 4), 
              email: Faker::Internet.unique.email(domain: "yopmail.com"), 
              password: "123456",
              password_confirmation: "123456")
end

5.times do
  Event.create(start_date: Faker::Time.forward(days: 60, format: :long), 
               duration: 120, 
               title: Faker::Marketing.unique.buzzwords, 
               description: Faker::Lorem.paragraph(sentence_count: 5), 
               price: Faker::Number.within(range: 1..100), 
               location: Faker::Address.street_address, 
               admin: User.all.sample)
end

5.times do
  Event.create(start_date: Faker::Time.forward(days: 60, format: :long), 
               duration: 120, 
               title: Faker::Marketing.unique.buzzwords, 
               description: Faker::Lorem.paragraph(sentence_count: 5), 
               price: 0, 
               location: Faker::Address.street_address, 
               admin: User.all.sample)
end

15.times do
  Attendance.create(stripe_customer_id: User.all.sample, 
                    event: Event.all.sample, 
                    participant: User.all.sample)
end

