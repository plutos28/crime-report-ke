# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

common_password = '123456'

emails = [
  "thabo.molefe@mail.com",
  "nomvula.ndlovu@yahoo.com",
  "sibusiso.mkhize@hotmail.com",
  "lerato.modise@outlook.com",
  "mpho.ngwenya@gmail.com",
  "ntombi.buthelezi@aol.com",
  "lungelo.zulu@icloud.com",
  "busisiwe.mthembu@protonmail.com",
  "thulani.ndaba@mailinator.com",
  "ntokozo.ndebele@tutanota.com",
  "zanele.mkhabela@pm.me",
  "bongani.ngcobo@zoho.com",
  "mary.wanjiru@gmail.com",
  "john.mwangi@yahoo.com",
  "janice.achieng@hotmail.com",
  "peter.kariuki@outlook.com",
  "grace.akinyi@aol.com",
  "david.nyambura@icloud.com",
  "sarah.onyango@live.com",
  "james.kamau@protonmail.com",
  "ruth.muthoni@mail.com",
  "patrick.odhiambo@inbox.com",
  "jane.kinyanjui@yandex.com",
  "brian.ochieng@zoho.com",
  "carol.njoroge@fastmail.com",
  "martin.wambui@mailinator.com",
  "lucy.ongeri@tutanota.com",
  "michael.njeri@cock.li",
  "esther.chege@keemail.me",
  "paul.gichuru@hushmail.com",
  "susan.karanja@pm.me",
  "daniel.mutisya@protonmail.ch",
  "sato.taro@example.co.jp",
  "tanaka.yuko@example.jp",
  "suzuki.ryohei@example.ne.jp",
  "watanabe.emi@example.jp",
  "ito.shinji@example.co.jp",
  "yamamoto.ayumi@example.ne.jp",
  "nakamura.kenji@example.jp",
  "kobayashi.miyuki@example.co.jp",
  "kimura.masato@example.jp",
  "ishikawa.mio@example.ne.jp",
  "yoshida.takashi@example.co.jp",
  "sasaki.nana@example.jp",
  "yamada.hiroki@example.ne.jp",
  "matsumoto.ami@example.jp",
  "inoue.yuki@example.co.jp",
  "takahashi.kana@example.jp",
]

emails.each do |email|
    User.create(email: email, password: common_password, password_confirmation: common_password)
end

# Create an array of possible types of crime
crime_types = [
  # Violent Crimes
  "Assault",
  "Battery",
  "Homicide",
  "Robbery",
  "Sexual Assault",
  "Kidnapping",
  
  # Property/Theft Crimes
  "Burglary",
  "Theft",
  "Shoplifting",
  "Auto Theft",
  "Arson",
  "Vandalism",
  
  # Disorder/Disturbance Crimes
  "Public Intoxication",
  "Disorderly Conduct",
  "Disturbing the Peace",
  "Trespassing",
  "Loitering",
  "Illegal Parking",
  
  # 911-related Incidents
  "Emergency Medical Assistance",
  "Fire",
  "Domestic Violence",
  "Traffic Accident",
  "Suspicious Activity",
  "Missing Person",
  
  # Crimes related to Cars
  "Hit and Run"
]

# Number of reports to create
num_reports = 50

# Central location coordinates
central_location = [36.7875742516186, -1.2782562240223]

# Distance range (in degrees)
distance_range = 0.01

# Create reports
num_reports.times do
  # Generate random latitude and longitude around the central location
  longitude = central_location[0] + rand(-distance_range..distance_range)
  latitude = central_location[1] + rand(-distance_range..distance_range)
  
  # Randomly select a type of crime
  type_of_crime = crime_types.sample
  
  # Generate a title based on the type of crime
  title = case type_of_crime
          when "Assault"
            "Assault in Downtown Area"
          when "Battery"
            "Battery Incident at Local Bar"
          when "Homicide"
            "Homicide Investigation Underway"
          when "Robbery"
            "Armed Robbery at Bank"
          # Add more cases as needed
          else
            "Crime Report: #{type_of_crime}"
          end
  
  # Generate a description based on the type of crime
  description = case type_of_crime
                when "Assault"
                  "A violent altercation occurred on Main Street resulting in serious injuries."
                when "Battery"
                  "A fight broke out between patrons at a local bar, leading to multiple injuries."
                when "Homicide"
                  "Police are investigating a homicide that occurred in the early hours of the morning."
                when "Robbery"
                  "An armed individual robbed a bank in broad daylight, making off with cash."
                # Add more cases as needed
                else
                  "Description for #{type_of_crime} incident."
                end
  
  # Create the report
  Report.create!(
    title: title,
    description: description,
    type_of_crime: type_of_crime,
    longitude: longitude,
    latitude: latitude
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?