# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PlantType.destroy_all
State.destroy_all
Action.destroy_all
User.destroy_all
Ailment.destroy_all

PlantType.create(name: "Rose")
State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Rose"), img_url:"/app/assets/images/Plant_Gifs/Rose/Rose.gif")
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Rose"), img_url:"/app/assets/images/Plant_Gifs/Rose/Rose - Seedling Grow idle.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Rose")).id)
State.create(name: "Seedling", max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Rose"), img_url:"/app/assets/images/Plant_Gifs/Rose/Rose - Seed Plant.gif", next_id: State.find_by(name: "Juvenile", plant_type:PlantType.find_by(name: "Rose")).id)

PlantType.create(name: "Cactus")
State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Cactus"), img_url:"/app/assets/images/Plant_Gifs/Cactus/Cactus Bae.gif")
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Cactus"),img_url:"/app/assets/images/Plant_Gifs/Cactus/Cactus Bae - Juvenile grow.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Cactus")).id)
State.create(name: "Seedling", max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Cactus"), img_url:"/app/assets/images/Plant_Gifs/Cactus/Cactus Bae - Seed Plant.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Cactus")).id)

Action.create(name:"Add Soil")
Action.create(name:"Add Water")
Action.create(name:"Move to Sunlight")
Action.create(name:"Shout")
Action.create(name:"Whisper Sweet Nothings & Stroke the Leaves")

Ailment.create(ailment_type:"Bugz", action:Action.find_by(name:"Shout"))
Ailment.create(ailment_type:"Too Much Shade", action:Action.find_by(name:"Move to Sunlight"))
Ailment.create(ailment_type:"Knocked Over", action:Action.find_by(name:"Add Soil"))
Ailment.create(ailment_type:"Sad", action:Action.find_by(name:"Whisper Sweet Nothings & Stroke the Leaves"))
