require 'faker'

8.times do
	doctor = Doctor.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, postal_code: rand(1000..9999))
	doctor.city = City.all.sample
end

20.times do
	patient = Patient.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
	patient.city = City.all.sample
end

30.times do
	t =
	appointment = Appointment.new(date: Faker::Time.forward(14, :all))
	appointment.doctor = Doctor.all.sample
	appointment.patient = Patient.all.sample
	appointment.city = City.all.sample
	appointment.save
end

7.times do
	city = City.create!(name: Faker::Nation.capital_city)
end

5.times do
	specialty = Specialty.create!(name: Faker::Science.element)
end

50.times do
	join = JoinTableDoctorSpecialty.new
	join.doctor = Doctor.all.sample
	join.specialty = Specialty.all.sample
	join.save
end
