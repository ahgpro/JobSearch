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
    label: "video",
    jobs: [
      { name: "cameraman", picture: "monteur.png" },
      { name: "perchiste", picture: "perchiste.jpg" },
      { name: "assistant-monteur", picture: "monteur-video.png" },
      { name: "monteur", picture: "" },
      { name: "figurant", picture: "figurant.jpg" }
    ]
  },
  {
    label: "musique",
    jobs: [
      { name: "compositeur", picture: "compositeur.png" },
      { name: "chanteur", picture: "chanteur.jpg" },
      { name: "guitariste", picture: "guitariste.jpg" }
    ]
  }
]

puts "- Seed Domains and Jobs"

domains.each do |domain|
  d = Domain.create(label: domain[:label])
  domain[:jobs].each do |job|
    job = Job.create(name: job[:name], picture: job[:picture], domain: d)
  end
end


