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
State.create(name: "Seedling", cost:20, max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Rose"), img_url:"/app/assets/images/Plant_Gifs/Rose/Rose - Seed Plant.gif", next_id: State.find_by(name: "Juvenile", plant_type:PlantType.find_by(name: "Rose")).id)

PlantType.create(name: "Money Tree")
State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Money Tree"), img_url:"/app/assets/images/Plant_Gifs/Money Tree/Money Tree.gif")
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Money Tree"), img_url:"/app/assets/images/Plant_Gifs/Money Tree/Money Tree - Seedling Grow.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Money Tree")).id)
State.create(name: "Seedling", cost:20, max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Money Tree"), img_url:"/app/assets/images/Plant_Gifs/Money Tree/Money Tree - Seed Plant.gif", next_id: State.find_by(name: "Juvenile", plant_type:PlantType.find_by(name: "Money Tree")).id)

PlantType.create(name: "Cactus")
State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Cactus"), img_url:"/app/assets/images/Plant_Gifs/Cactus/Cactus Bae.gif")
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Cactus"),img_url:"/app/assets/images/Plant_Gifs/Cactus/Cactus Bae - Juvenile grow.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Cactus")).id)
State.create(name: "Seedling", cost:20, max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Cactus"), img_url:"/app/assets/images/Plant_Gifs/Cactus/Cactus Bae - Seed Plant.gif", next_id: State.find_by(name: "Juvenile", plant_type: PlantType.find_by(name: "Cactus")).id)


PlantType.create(name: "Mystery")
State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Mystery"), img_url:"/app/assets/images/Plant_Gifs/Groot/Adult-Groot.gif")
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Mystery"),img_url:"/app/assets/images/Plant_Gifs/Groot/Juvinelle-Groot.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Mystery")).id)
State.create(name: "Seedling", cost:50, max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Mystery"), img_url:"/app/assets/images/Plant_Gifs/Groot/Seedling-Groot.png", next_id: State.find_by(name: "Juvenile", plant_type: PlantType.find_by(name: "Mystery")).id)

PlantType.create(name: "Fire Pokemon")
State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Fire Pokemon"), img_url:"/app/assets/images/Plant_Gifs/Charmander/charzard.gif")
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Fire Pokemon"),img_url:"/app/assets/images/Plant_Gifs/Charmander/charmeleon.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Fire Pokemon")).id)
State.create(name: "Seedling", cost:10, max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Fire Pokemon"), img_url:"/app/assets/images/Plant_Gifs/Charmander/charmander.gif", next_id: State.find_by(name: "Juvenile", plant_type: PlantType.find_by(name: "Fire Pokemon")).id)

PlantType.create(name: "Piranha Plant")
# State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Pirahna Plant"), img_url:"/app/assets/images/Plant_Gifs/Pirahna Plant/Pirahna Plant.gif")
# State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Pirahna Plant"), img_url:"/app/assets/images/Plant_Gifs/Pirahna Plant/Pirahna Plant - Seedling Grow idle.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Pirahna Plant")).id)
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Piranha Plant"), img_url:"/app/assets/images/Plant_Gifs/PirahnaPlant/pirahna-plant.gif")
State.create(name: "Seedling", cost:10, max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Piranha Plant"), img_url:"/app/assets/images/Plant_Gifs/PirahnaPlant/flower-plant-pipe.png", next_id: State.find_by(name: "Juvenile", plant_type:PlantType.find_by(name: "Piranha Plant")).id)

PlantType.create(name: "Tree Man")
State.create(name: "Adult", max_hp:6, water_need:6, soil_need:6, plant_type:PlantType.find_by(name: "Tree Man"), img_url:"/app/assets/images/Plant_Gifs/TreeMan/tree-man.gif")
State.create(name: "Juvenile", max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Tree Man"), img_url:"/app/assets/images/Plant_Gifs/Rose/Rose - Seedling Grow.gif", next_id: State.find_by(name: "Adult", plant_type: PlantType.find_by(name: "Tree Man")).id)
State.create(name: "Seedling", cost:5, max_hp:2, water_need:2, soil_need:2, plant_type:PlantType.find_by(name: "Tree Man"), img_url:"/app/assets/images/Plant_Gifs/Rose/Rose - Seed Plant.gif", next_id: State.find_by(name: "Juvenile", plant_type:PlantType.find_by(name: "Tree Man")).id)

PlantType.create(name: "Succulent")
State.create(name: "Seedling", cost:1, max_hp:4, water_need:4, soil_need:4, plant_type:PlantType.find_by(name: "Succulent"), img_url:"/app/assets/images/Plant_Gifs/Succulent/succulent.gif")

Action.create(name:"Add Soil")
Action.create(name:"Add Water")
# Action.create(name:"Move to Sunlight")
# Action.create(name:"Shout")
Action.create(name:"Talk to Plant")
Action.create(name:"Get $$$$")
# Action.create(name: "Stroke the Leaves")

# Ailment.create(ailment_type:"Bugz", action:Action.find_by(name:"Shout"))
# Ailment.create(ailment_type:"Too Much Shade", action:Action.find_by(name:"Move to Sunlight"))
# Ailment.create(ailment_type:"Knocked Over", action:Action.find_by(name:"Add Soil"))
Ailment.create(ailment_type:"Sad", action:Action.find_by(name:"Talk to Plant"))
# Ailment.create(ailment_type:"Sad", action:Action.find_by(name:"Stroke the Leaves"))
