# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Record.create(user_id: 3 ,step: 2000 ,recorded: "2023/01/01" )
# Record.create(user_id: 3 ,step: 2000 ,recorded: "2023/01/02" )
# Record.create(user_id: 3 ,step: 2000 ,recorded: "2023/01/03" )
# Record.create(user_id: 3 ,step: 2000 ,recorded: "2023/01/04" )

Level.create(id: 1 ,level_name: "初級" ,goal_step: 4000 ,level_stop: "なし")
Level.create(id: 2 ,level_name: "中級" ,goal_step: 6000 ,level_stop: "なし")
Level.create(id: 3 ,level_name: "上級" ,goal_step: 8000 ,level_stop: "なし")