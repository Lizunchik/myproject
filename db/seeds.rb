# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML.load_file(seed_file)
conf = HashWithIndifferentAccess.new(config)
    conf[:projects].each do |project|
        @project = Project.create({title: project[:title]})
        puts project[:title]
        project[:todos].each do |todo|
            @project.todos.create ({text: todo[:text], isCompleted: todo[:isCompleted]})
            puts todo[:text]
        end
        @todos = @project.todos.all
        puts "\n"
      end
