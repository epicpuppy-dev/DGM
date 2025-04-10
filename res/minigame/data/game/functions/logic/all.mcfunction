execute store result score @s y_level run data get entity @s Pos[1]
execute if score @s y_level matches ..-128 run damage @s 2048 out_of_world

execute unless score @s kit_target matches 0.. run scoreboard players set @s kit_target 0
execute if score @s kit_assault matches 1 run scoreboard players set @s kit_target 0
execute if score @s kit_cqc matches 1 run scoreboard players set @s kit_target 1
execute if score @s kit_smg matches 1 run scoreboard players set @s kit_target 2
execute if score @s kit_sniper matches 1 run scoreboard players set @s kit_target 3
execute if score @s kit_medic matches 1 run scoreboard players set @s kit_target 4
execute if score @s kit_grenade matches 1 run scoreboard players set @s kit_target 5
scoreboard players set @s kit_assault 0
scoreboard players set @s kit_cqc 0
scoreboard players set @s kit_smg 0
scoreboard players set @s kit_sniper 0
scoreboard players set @s kit_medic 0
scoreboard players set @s kit_grenade 0

# Respawning
execute if score @s respawn matches 100 run title @s title {"text": "5", "color": "red"}
execute if score @s respawn matches 80 run title @s title {"text": "4", "color": "red"}
execute if score @s respawn matches 60 run title @s title {"text": "3", "color": "red"}
execute if score @s respawn matches 40 run title @s title {"text": "2", "color": "red"}
execute if score @s respawn matches 20 run title @s title {"text": "1", "color": "red"}
execute if score @s respawn matches 0 run function game:logic/respawn
scoreboard players remove @s respawn 1

# Kill Logic
execute if score @s kills matches 1.. if score @s kit matches 0 run give @s tacz:ammo{AmmoId:"tacz:556x45"} 30
execute if score @s kills matches 1.. if score @s kit matches 0 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 14
execute if score @s kills matches 1.. if score @s kit matches 1 run give @s tacz:ammo{AmmoId:"tacz:12g"} 6
execute if score @s kills matches 1.. if score @s kit matches 1 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 10
execute if score @s kills matches 1.. if score @s kit matches 2 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 30
execute if score @s kills matches 1.. if score @s kit matches 3 run give @s tacz:ammo{AmmoId:"tacz:30_06"} 5
execute if score @s kills matches 1.. if score @s kit matches 3 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 10
execute if score @s kills matches 1.. if score @s kit matches 4 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 20
execute if score @s kills matches 1.. if score @s kit matches 5 run give @s tacz:ammo{AmmoId:"tacz:40mm"} 4
execute if score @s kills matches 1.. if score @s kit matches 5 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 10

execute if entity @s[team=red] run function game:logic/red
execute if entity @s[team=blue] run function game:logic/blue

execute if score @s kills matches 1.. run give @s potion{CustomPotionColor:11546150,CustomPotionEffects:[{Id:10,Duration:65,Amplifier:4}],display:{Name:'["",{"text":"Health Pack","italic":false}]'}}
execute if score @s kills matches 1.. run scoreboard players remove @s kills 1
