# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'fr'
puts 'Locale: fr'

JobApplication.destroy_all
User.destroy_all
puts 'DB cleaned up'

user_0 = User.create(email: 'user0@yopmail.com', password: '123456')
puts "Created user: #{user_0.email}"

user_1 = User.create(email: 'user1@yopmail.com', password: '123456')
puts "Created user: #{user_1.email}"

job_application_0 = JobApplication.create(
  user: user_0,
  title: 'Titre du job 0',
  description: '**Profil recherché :**

De formation supérieure Bac+5 en Master en statistique ou école ingénieur spécialisé en Data Science, statistique, vous justifiez d’une expérience entre 5 ans et 8 ans en Datamining / Data Science / Analytics idéalement acquise dans le marketing direct (cross canal) / VAD et le digital.

Capacité à évoluer :

- dans des environnements S.I. multiples avec des modèles de données différents, à forte volumétrie
- sur des problématiques business très larges (acquisition, développement de la valeur, fidélisation, rétention) et de tout secteur (presse, assurance, complément alimentaire, monétisation de la data…),
- de façon transversale,
- en mode projet,
- dans un environnement de mise en place de solutions opérationnelles'
)
puts "Created job application: #{job_application_0.title}"

job_application_1 = JobApplication.create(
  user: user_1,
  title: 'Titre du job 1',
  description: 'Description du job 1'
)
puts "Created job application: #{job_application_1.title}"

10.times do
  job_application = JobApplication.create(
    user: user_0,
    title: Faker::Job.title,
    description: Faker::Job.field
  )
  puts "Created job application: #{job_application.title}"
end
