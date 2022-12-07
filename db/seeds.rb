# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Level.create(id: 0, level_name: "初級", level_stop: "なし")
Level.create(id: 1, level_name: "中級", level_stop: "なし")
Level.create(id: 2, level_name: "上級", level_stop: "あり")