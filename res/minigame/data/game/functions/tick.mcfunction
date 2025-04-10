execute as @a run function game:logic/all

execute as @a[scores={deaths=1..}] run function game:logic/death

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

execute positioned $JOIN_BLUE$ unless score active values matches 1 run team join blue @a[distance=..2]
execute positioned $JOIN_RED$ unless score active values matches 1 run team join red @a[distance=..2]

execute as @a[scores={health=..20}] run effect give @s regeneration 2 1 true

function game:scoreboard

# Utility commands
execute unless score active values matches 1 run scoreboard players enable @a time_5m
execute unless score active values matches 1 run scoreboard players enable @a time_10m
execute unless score active values matches 1 run scoreboard players enable @a time_15m
execute unless score active values matches 1 run scoreboard players enable @a time_20m
execute unless score active values matches 1 run scoreboard players enable @a start_game

execute as @a[scores={time_5m=1..}] run function game:util/time_5m
execute as @a[scores={time_10m=1..}] run function game:util/time_10m
execute as @a[scores={time_15m=1..}] run function game:util/time_15m
execute as @a[scores={time_20m=1..}] run function game:util/time_20m
execute as @a[scores={start_game=1..}] run function game:util/start_game
