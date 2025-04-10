scoreboard players add point_clock values 1
scoreboard players operation tick_a values = point_clock values
scoreboard players operation tick_b values = point_clock values
scoreboard players operation tick_c values = point_clock values
scoreboard players operation tick_a values %= mtick_a values
scoreboard players operation tick_b values %= mtick_b values
scoreboard players operation tick_c values %= mtick_c values

execute if score tick_a values matches 0 if score owner_a values matches 1 run scoreboard players add red values 1
execute if score tick_a values matches 0 if score owner_a values matches -1 run scoreboard players add blue values 1
execute if score tick_b values matches 0 if score owner_b values matches 1 unless score red values = need values run scoreboard players add red values 1
execute if score tick_b values matches 0 if score owner_b values matches -1 unless score blue values = need values run scoreboard players add blue values 1
execute if score tick_c values matches 0 if score owner_c values matches 1 unless score red values = need values run scoreboard players add red values 1
execute if score tick_c values matches 0 if score owner_c values matches -1 unless score blue values = need values run scoreboard players add blue values 1

scoreboard players operation progress_a values = point_clock values
scoreboard players operation progress_b values = point_clock values
scoreboard players operation progress_c values = point_clock values
scoreboard players operation progress_a values %= mprogress_a values
scoreboard players operation progress_b values %= mprogress_b values
scoreboard players operation progress_c values %= mprogress_c values

execute if score progress_a values matches 0 unless score capture_a values matches 20 positioned -892 16 -688 if entity @a[team=red,distance=..4] run scoreboard players add capture_a values 1
execute if score progress_a values matches 0 unless score capture_a values matches -20 positioned -892 16 -688 if entity @a[team=blue,distance=..4] run scoreboard players remove capture_a values 1
execute if score progress_b values matches 0 unless score capture_b values matches 20 positioned -892 16 -642 if entity @a[team=red,distance=..4] run scoreboard players add capture_b values 1
execute if score progress_b values matches 0 unless score capture_b values matches -20 positioned -892 16 -642 if entity @a[team=blue,distance=..4] run scoreboard players remove capture_b values 1
execute if score progress_c values matches 0 unless score capture_c values matches 20 positioned -892 8 -665 if entity @a[team=red,distance=..4] run scoreboard players add capture_c values 1
execute if score progress_c values matches 0 unless score capture_c values matches -20 positioned -892 8 -665 if entity @a[team=blue,distance=..4] run scoreboard players remove capture_c values 1

execute unless score owner_a values matches 1 if score capture_a values matches 20 run tellraw @a ["",{"text":"Red","color":"red"},{"text":" captured ","color":"gray"},{"text":"Point A","color":"red"}]
execute unless score owner_a values matches 1 if score capture_a values matches 20 positioned -892 16 -688 run summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,tag:{Fireworks:{Flight:1,Explosions:[{Colors:[I;11546150]}]}},Count:1}}
execute unless score owner_a values matches 1 if score capture_a values matches 20 run scoreboard players set owner_a values 1
execute if score owner_a values matches 1 if score capture_a values matches 0 run tellraw @a ["",{"text":"Red","color":"red"},{"text":" lost ","color":"gray"},{"text":"Point A","color":"white"}]
execute if score owner_a values matches 1 if score capture_a values matches 0 run scoreboard players set owner_a values 0
execute if score owner_a values matches -1 if score capture_a values matches 0 run tellraw @a ["",{"text":"Blue","color":"blue"},{"text":" lost ","color":"gray"},{"text":"Point A","color":"white"}]
execute if score owner_a values matches -1 if score capture_a values matches 0 run scoreboard players set owner_a values 0
execute unless score owner_a values matches -1 if score capture_a values matches 20 run tellraw @a ["",{"text":"Blue","color":"blue"},{"text":" captured ","color":"gray"},{"text":"Point A","color":"blue"}]
execute unless score owner_a values matches -1 if score capture_a values matches 20 positioned -892 16 -688 run summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,tag:{Fireworks:{Flight:1,Explosions:[{Colors:[I;3949738]}]}},Count:1}}
execute unless score owner_a values matches -1 if score capture_a values matches 20 run scoreboard players set owner_a values -1

execute unless score owner_b values matches 1 if score capture_b values matches 20 run tellraw @a ["",{"text":"Red","color":"red"},{"text":" captured ","color":"gray"},{"text":"Point B","color":"red"}]
execute unless score owner_b values matches 1 if score capture_b values matches 20 positioned -892 16 -642 run summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,tag:{Fireworks:{Flight:1,Explosions:[{Colors:[I;11546150]}]}},Count:1}}
execute unless score owner_b values matches 1 if score capture_b values matches 20 run scoreboard players set owner_a values 1
execute if score owner_b values matches 1 if score capture_b values matches 0 run tellraw @a ["",{"text":"Red","color":"red"},{"text":" lost ","color":"gray"},{"text":"Point B","color":"white"}]
execute if score owner_b values matches 1 if score capture_b values matches 0 run scoreboard players set owner_a values 0
execute if score owner_b values matches -1 if score capture_b values matches 0 run tellraw @a ["",{"text":"Blue","color":"blue"},{"text":" lost ","color":"gray"},{"text":"Point B","color":"white"}]
execute if score owner_b values matches -1 if score capture_b values matches 0 run scoreboard players set owner_a values 0
execute unless score owner_b values matches -1 if score capture_b values matches 20 run tellraw @a ["",{"text":"Blue","color":"blue"},{"text":" captured ","color":"gray"},{"text":"Point B","color":"blue"}]
execute unless score owner_b values matches -1 if score capture_b values matches 20 positioned -892 16 -642 run summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,tag:{Fireworks:{Flight:1,Explosions:[{Colors:[I;3949738]}]}},Count:1}}
execute unless score owner_b values matches -1 if score capture_b values matches 20 run scoreboard players set owner_a values -1

execute unless score owner_c values matches 1 if score capture_c values matches 20 run tellraw @a ["",{"text":"Red","color":"red"},{"text":" captured ","color":"gray"},{"text":"Center","color":"red"}]
execute unless score owner_c values matches 1 if score capture_c values matches 20 positioned -892 8 -665 run summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,tag:{Fireworks:{Flight:1,Explosions:[{Colors:[I;11546150]}]}},Count:1}}
execute unless score owner_c values matches 1 if score capture_c values matches 20 run scoreboard players set owner_a values 1
execute if score owner_c values matches 1 if score capture_c values matches 0 run tellraw @a ["",{"text":"Red","color":"red"},{"text":" lost ","color":"gray"},{"text":"Center","color":"white"}]
execute if score owner_c values matches 1 if score capture_c values matches 0 run scoreboard players set owner_a values 0
execute if score owner_c values matches -1 if score capture_c values matches 0 run tellraw @a ["",{"text":"Blue","color":"blue"},{"text":" lost ","color":"gray"},{"text":"Center","color":"white"}]
execute if score owner_c values matches -1 if score capture_c values matches 0 run scoreboard players set owner_a values 0
execute unless score owner_c values matches -1 if score capture_c values matches 20 run tellraw @a ["",{"text":"Blue","color":"blue"},{"text":" captured ","color":"gray"},{"text":"Center","color":"blue"}]
execute unless score owner_c values matches -1 if score capture_c values matches 20 positioned -892 8 -665 run summon firework_rocket ~ ~1 ~ {LifeTime:20,FireworksItem:{id:firework_rocket,tag:{Fireworks:{Flight:1,Explosions:[{Colors:[I;3949738]}]}},Count:1}}
execute unless score owner_c values matches -1 if score capture_c values matches 20 run scoreboard players set owner_a values -1

scoreboard players operation owner_display values = owner_a values
scoreboard players operation capture_display values = capture_a values
execute positioned -892 16 -688 run function game:display
scoreboard players operation owner_display values = owner_b values
scoreboard players operation capture_display values = capture_b values
execute positioned -892 16 -642 run function game:display
scoreboard players operation owner_display values = owner_c values
scoreboard players operation capture_display values = capture_c values
execute positioned -892 8 -665 run function game:display

execute if score red values = need values run title @a times 20 100 20
execute if score red values = need values run title @a title {"text": "RED WINS", "color": "red", "bold": true}
execute if score red values = need values run gamemode spectator @a
execute if score red values = need values run scoreboard players set active values 0

execute if score blue values = need values run title @a times 20 100 20
execute if score blue values = need values run title @a title {"text": "BLUE WINS", "color": "blue", "bold": true}
execute if score blue values = need values run gamemode spectator @a
execute if score blue values = need values run scoreboard players set active values 0