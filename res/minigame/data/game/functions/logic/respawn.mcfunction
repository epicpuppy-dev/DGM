gamemode adventure @s
tp @s[team=red] $RED_SPAWN$
tp @s[team=blue] $BLUE_SPAWN$
execute store result score @s kit run scoreboard players get @s kit_target
execute if score @s kit matches 0 run function game:kits/assault
execute if score @s kit matches 1 run function game:kits/cqc
execute if score @s kit matches 2 run function game:kits/smg
execute if score @s kit matches 3 run function game:kits/sniper
execute if score @s kit matches 4 run function game:kits/medic
execute if score @s kit matches 5 run function game:kits/grenade
