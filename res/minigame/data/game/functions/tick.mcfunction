execute as @a run function game:logic/all

execute as @a[scores={deaths=1..}] run function game:logic/death

execute as @a[scores={kit_assault=1..}] run function game:kits/assault
execute as @a[scores={kit_sniper=1..}] run function game:kits/sniper
execute as @a[scores={kit_cqc=1..}] run function game:kits/cqc
execute as @a[scores={kit_medic=1..}] run function game:kits/medic
execute as @a[scores={kit_smg=1..}] run function game:kits/smg
execute as @a[scores={kit_grenade=1..}] run function game:kits/grenade

scoreboard players enable @a kit_assault
scoreboard players enable @a kit_sniper
scoreboard players enable @a kit_cqc
scoreboard players enable @a kit_medic
scoreboard players enable @a kit_smg
scoreboard players enable @a kit_grenade

clear @a glass_bottle
kill @e[type=item,nbt={Item:{id:"tacz:modern_kinetic_gun"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:leather_helmet"}}]
kill @e[type=item,nbt={Item:{id:"mcore:titanium_chestplate"}}]
kill @e[type=item,nbt={Item:{id:"mcore:titanium_leggings"}}]
kill @e[type=item,nbt={Item:{id:"mcore:titanium_boots"}}]
kill @e[type=item,nbt={Item:{id:"tacz:ammo_box"}}]
kill @e[type=item,nbt={Item:{id:"tacz:ammo"}}]
kill @e[type=item,nbt={Item:{id:"minecraft:splash_potion"}}]

execute if score active values matches 0 run effect give @a weakness 2 5 true
execute if score active values matches 1.. run function game:logic/timer

execute positioned $JOIN_BLUE$ unless score active values matches 1 run team join blue @a[distance=..2]
execute positioned $JOIN_RED$ unless score active values matches 1 run team join red @a[distance=..2]

execute as @a[scores={health=..20}] run effect give @s regeneration 2 1 true

bossbar set game players @a
bossbar set game name ["",{"text":"Blue ","bold":true,"color":"blue"},{"score":{"name":"blue","objective":"values"},"color":"white"},{"text":" | ","color":"black"},{"text":"Red ","bold":true,"color":"red"},{"score":{"name":"red","objective":"values"},"color":"white"}]