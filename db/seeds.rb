# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "-- Start Seeding"

puts "Destroying everything"
ProjectJob.destroy_all
Project.destroy_all
User.destroy_all
Job.destroy_all
Domain.destroy_all


domains = [
    {
    label: "Film",
    jobs: [
      { name: "Acteur", picture: "actor-male.jpg" },
      { name: "Actrice", picture: "actor-female.jpg" },
      { name: "Figurant homme", picture: "figurant-male.jpg" },
      { name: "Figurant femme", picture: "figurant-female.jpg" },
      { name: "Cascadeur homme", picture: "cascadeur-male.jpg" },
      { name: "Cascadeur femme", picture: "cascadeur-male.jpg" },
      { name: "Voix off homme", picture: "voix-off.jpg" },
      { name: "Voix off femme", picture: "voix-off.jpg" }
    ]
  },
  {
    label: "Musique",
    jobs: [
      { name: "Chanteur", picture: "chanteur.jpg" },
      { name: "Chanteuse", picture: "singer-female.jpg" },
      { name: "Compositeur", picture: "compositeur.png" },
      { name: "Guitariste", picture: "guitariste.jpg" },
      { name: "Trompettiste", picture: "trompet.jpg" },
      { name: "Violoniste", picture: "violin.jpg" },
      { name: "Batteur", picture: "batteur.jpg" }
    ]
  },
  {
    spectacle: "Spectacle",
    jobs: [
      { name: "Animateur", picture: "animateur.jpg" },
      { name: "Comédiens", picture: "comedien.jpg" },
      { name: "Danseur/Danseuse", picture: "dancer-girls.jpg" },
      { name: "Magicien", picture: "magician.jpg" },
      { name: "Jongleur", picture: "juggler.jpg" },
      { name: "Clown", picture: "clown.jpg" }


    ]
  },
  {
    label: "Techniciens",
    jobs: [
      { name: "Cameraman", picture: "monteur.png" },
      { name: "Preneur son", picture: "" },
      { name: "Perchiste", picture: "perchiste.jpg" },
      { name: "Monteur", picture: "" },
      { name: "Assistant-monteur", picture: "monteur-video.png" },
      { name: "Ingenieur son", picture: ""},
      { name: "Veejay", picture: ""}
    ]
  },
]




puts "- Seed Domains and Jobs"

domains.each do |domain|
  d = Domain.create(label: domain[:label])
  domain[:jobs].each do |job|
    job = Job.create(name: job[:name], picture: job[:picture], domain: d)
  end
end


