# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'fr'
puts 'Locale: fr'

JobInformation.destroy_all
JobApplication.destroy_all
User.destroy_all
puts 'DB cleaned up'

user = User.create(email: 'user@yopmail.com', password: '123456')
puts "Created user: #{user.email}"

job_application_0 = user.job_applications.create(
  title: 'Titre du job 0'
)
puts "Created job application: #{job_application_0.title} with id #{job_application_0.id}"

job_information_0_0 = job_application_0.job_informations.create(
  name: 'Info 1',
  content: '**Profil recherché :**

De formation supérieure Bac+5 en Master en statistique ou école ingénieur spécialisé en Data Science, statistique, vous justifiez d’une expérience entre 5 ans et 8 ans en Datamining / Data Science / Analytics idéalement acquise dans le marketing direct (cross canal) / VAD et le digital.

Capacité à évoluer :

- dans des environnements S.I. multiples avec des modèles de données différents, à forte volumétrie
- sur des problématiques business très larges (acquisition, développement de la valeur, fidélisation, rétention) et de tout secteur (presse, assurance, complément alimentaire, monétisation de la data…),
- de façon transversale,
- en mode projet,
- dans un environnement de mise en place de solutions opérationnelles'
)

job_information_0_0 = job_application_0.job_informations.create(
  name: 'Localisation',
  content: 'Montpellier'
)

puts "Created job application: #{job_application_0.title}"

3.times do
  job_application = JobApplication.create(
    user: user,
    title: Faker::Job.title
  )
  puts "Created job application: #{job_application.title}"
end
