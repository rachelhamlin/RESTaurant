# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create(name: 'Diet Coke', price: '2', category: 'drinks')
Item.create(name: 'Horchata', price: '3', category: 'drinks')
Item.create(name: 'Seltzer', price: '1', category: 'drinks')
Item.create(name: 'Tecate', price: '5', category: 'drinks')
Item.create(name: 'Fish Taco', price: '4', category: 'meals')
Item.create(name: 'Carnitas Taco', price: '5', category: 'meals')
Item.create(name: 'Chicken Burrito', price: '8', category: 'meals')
Item.create(name: 'Quiona Salad', price: '10', category: 'meals')
Item.create(name: 'Veggie Taco', price: '4', category: 'meals')
Item.create(name: 'Ice Cream', price: '6', category: 'desserts')
Item.create(name: 'Flan', price: '6', category: 'desserts')
