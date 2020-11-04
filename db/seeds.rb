# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

Ingredient.create(name: 'Mint')
Ingredient.create(name: 'Vodka')
Ingredient.create(name: 'Rhum')
Ingredient.create(name: 'Tequila')
Ingredient.create(name: 'Orange Juice')
Ingredient.create(name: 'Tomato Juice')

cocktail_db_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(cocktail_db_url).read)['drinks']

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

cocktails = ['Mohito', 'Bloody Mary', 'Sex on the Beach', 'Margarita', 'Pina Colada']
cocktails.each { |cocktail| Cocktail.create(name: cocktail) }

c1 = Cocktail.where(name: 'Mohito').first

c2 = Cocktail.where(name: 'Bloody Mary').first
c3 = Cocktail.where(name: 'Sex on the Beach').first
c4 = Cocktail.where(name: 'Margarita').first

i1 = Ingredient.where(name: 'Mint').first
i2 = Ingredient.where(name: 'Vodka').first
i3 = Ingredient.where(name: 'Rhum').first
i4 = Ingredient.where(name: 'Tequila').first
i5 = Ingredient.where(name: 'Orange Juice').first
i6 = Ingredient.where(name: 'Tomato Juice').first

Dose.create(description: '6 leaves', cocktail: c1, ingredient: i1)
Dose.create(description: '1.5 oz', cocktail: c1, ingredient: i3)
Dose.create(description: '4.5 cl', cocktail: c2, ingredient: i2)
Dose.create(description: '9 cl', cocktail: c2, ingredient: i6)
Dose.create(description: '1.33 oz', cocktail: c3, ingredient: i2)
Dose.create(description: '1.33 oz', cocktail: c3, ingredient: i5)
Dose.create(description: '2 cl', cocktail: c4, ingredient: i4)
