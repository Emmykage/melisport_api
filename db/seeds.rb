# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

genders = Gender.create([{name: "men"}, {name: "women"}])
categories = ProductCategory.create([{name: "racquet", description: "For your first time on court to collecting titles on the pro tour, Babolat has a tennis racquet for every player. Babolat tennis racquets are designed to help you play your best and enjoy the game. We make tennis racquets for men, women, juniors & kids of all ages and abilities. Join millions of players around the world and check out the most popular Babolat tennis racquets like the spin producing Pure Aero, the power generating Pure Drive, or the control oriented Pure Strike. Not convinced? Ask Rafael Nadal, Dominic Thiem, Sofia Kenin, Li Na, and Kim Clijsters, or any other Babolat player."},
    {name: "shoe", description: "Get faster to the ball in Babolat tennis shoes. Stylish designs feature player-driven innovations and technologies that enhance agility, stability, and comfort. Babolat makes tennis shoes for men, women, juniors & kids of all ages and abilities. Looking for speed? Try the technology-loaded Babolat Jet Mach 3. Need our most durable tennis shoe? Check out the Babolat Propulse Fury. Desiring comfort and a wide-fit tennis shoe? Your feet will love the Babolat SFX3."},
    {name: "apparel", description: "Look, feel, and play your best in Babolat tennis apparel. Comfortable materials and exciting designs combine function and style for a look you will love." },
    {name: "bag", description: "Carry and protect all your tennis gear with the latest tennis bags and tennis backpacks from Babolat. Stylish and functional, whether you're carrying one tennis racquet or twelve. Designed for men, women, juniors & kids, Babolat tennis bags and tennis backpacks adapt to your needs, the number of tennis racquets you’re carrying and your budget. Protect your tennis equipment with stylish and comfortable tennis bags featuring dynamic designs in the colors of our tennis racquets, including the Pure Aero Rafa, the Pure Strike, the Pure Drive, and the Pure Aero. There’s a reason Babolat tennis bags and Babolat tennis backpacks are so popular. Isn’t it time to find out? 23 results"},
    {name: "accessory", description: "Enjoy all aspects of the game with Babolat's diverse selection of racquet accessories, educational & training tools, fan goodies, health & fitness gear, and court equipment."}])
