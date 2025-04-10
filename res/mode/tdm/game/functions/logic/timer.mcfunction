scoreboard players remove ticks values 1
execute if score ticks values matches 0 run scoreboard players remove seconds values 1
execute if score ticks values matches 0 run scoreboard players add ticks values 20
execute if score seconds values matches -1 run scoreboard players remove minutes values 1
execute if score seconds values matches -1 run scoreboard players add seconds values 60
execute if score minutes values matches 0 if score seconds values matches 0 run title @a times 20 100 20
execute if score minutes values matches 0 if score seconds values matches 0 run title @a title {"text": "GAME OVER", "color": "red", "bold": true}
execute if score minutes values matches 0 if score seconds values matches 0 run gamemode spectator @a
execute if score minutes values matches 0 if score seconds values matches 0 run scoreboard players set active values 0
execute if score seconds values matches 0..9 run title @a actionbar ["",{"text":"Time Left: ","color":"red"},{"score":{"name":"minutes","objective":"values"},"color":"gold"},{"text":":","color":"gray"},{"text":"0","color":"gold"},{"score":{"name":"seconds","objective":"values"},"color":"gold"}]
execute if score seconds values matches 10..59 run title @a actionbar ["",{"text":"Time Left: ","color":"red"},{"score":{"name":"minutes","objective":"values"},"color":"gold"},{"text":":","color":"gray"},{"score":{"name":"seconds","objective":"values"},"color":"gold"}]