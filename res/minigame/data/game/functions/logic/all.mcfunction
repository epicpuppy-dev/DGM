execute if score @s respawn matches 100 run title @s title {"text": "5", "color": "red"}
execute if score @s respawn matches 80 run title @s title {"text": "4", "color": "red"}
execute if score @s respawn matches 60 run title @s title {"text": "3", "color": "red"}
execute if score @s respawn matches 40 run title @s title {"text": "2", "color": "red"}
execute if score @s respawn matches 20 run title @s title {"text": "1", "color": "red"}
execute if score @s respawn matches 0 run gamemode adventure @s
execute if score @s respawn matches 0 if entity @s[team=red] run tp @s 0 32 69 180 0
execute if score @s respawn matches 0 if entity @s[team=blue] run tp @s 0 32 -69 0 0
scoreboard players remove @s respawn 1
execute if score @s kills matches 1.. if score @s kit matches 1 run give @s tacz:ammo{AmmoId:"tacz:556x45"} 30
execute if score @s kills matches 1.. if score @s kit matches 1 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 14
execute if score @s kills matches 1.. if score @s kit matches 2 run give @s tacz:ammo{AmmoId:"tacz:12g"} 6
execute if score @s kills matches 1.. if score @s kit matches 2 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 10
execute if score @s kills matches 1.. if score @s kit matches 3 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 30
execute if score @s kills matches 1.. if score @s kit matches 4 run give @s tacz:ammo{AmmoId:"tacz:30_06"} 5
execute if score @s kills matches 1.. if score @s kit matches 4 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 10
execute if score @s kills matches 1.. if score @s kit matches 5 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 20
execute if score @s kills matches 1.. if score @s kit matches 6 run give @s tacz:ammo{AmmoId:"tacz:40mm"} 4
execute if score @s kills matches 1.. if score @s kit matches 6 run give @s tacz:ammo{AmmoId:"tacz:45acp"} 10
execute if entity @s[team=red] run function game:logic/red
execute if entity @s[team=blue] run function game:logic/blue
execute if score @s kills matches 1.. run give @s potion{CustomPotionColor:11546150,CustomPotionEffects:[{Id:10,Duration:65,Amplifier:4}],display:{Name:'["",{"text":"Health Pack","italic":false}]'}}
execute if score @s kills matches 1.. run scoreboard players remove @s kills 1