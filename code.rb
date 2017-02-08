require 'pry'
class Ingredient

  def initialize(unit, quantity, name)
    @unit = unit
    @quantity = quantity
    @name = name
  end

  def check_ingredients
    safe_ingredients =
      ["Brussels sprouts", "spinach", "eggs", "milk", "tofu", "seitan", "bell peppers", "quinoa",
      "kale", "chocolate", "beer", "wine", "whiskey"]

      if safe_ingredients.include?(@name)
        puts true
      else
        puts false
      end
  end

  def self.parse(ingredient_string) #class method
    # "47 lbs Brussels Sprouts"
    info = ingredient_string.split
    quantity = info[0]
    unit = info[1]
    name = info[2]

    Ingredient.new(unit, quantity, name)
  end
end

ingredient = Ingredient.parse("47 lbs chocolate")

class Recipe

  def initialize(name, instructions, ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients

  end

  def check_recipe
    @ingredients.each do |ingredient|
      ingredient.check_ingredients
    end
  end
end

safe_name = "Chocolate Quinoa"
safe_ingredients = [
        Ingredient.new(1.0, "cup", "quinoa"),
        Ingredient.new(1.0, "cup", "chocolate"),
        Ingredient.new(2.0, "cup", "peanut butter")
      ]
safe_instructions = [
        "Melt chocolate.",
        "Pour over quinoa.",
        "Regret your life."
      ]
safe_recipe = Recipe.new(safe_name, safe_instructions, safe_ingredients)
binding.pry
puts safe_recipe
