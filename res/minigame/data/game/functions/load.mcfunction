scoreboard objectives add values dummy
scoreboard objectives add respawn dummy
scoreboard objectives add deaths deathCount
scoreboard objectives add kills playerKillCount
scoreboard objectives add health health
scoreboard objectives add kit dummy
scoreboard objectives add stat_deaths deathCount
scoreboard objectives add stat_kills playerKillCount {"text": "Kills", "color": "dark_red"}

scoreboard objectives setdisplay sidebar stat_kills
scoreboard objectives setdisplay list stat_deaths

scoreboard objectives add kit_assault dummy
scoreboard objectives add kit_cqc dummy
scoreboard objectives add kit_smg dummy
scoreboard objectives add kit_sniper dummy
scoreboard objectives add kit_medic dummy
scoreboard objectives add kit_grenade dummy

gamerule doImmediateRespawn true
gamerule naturalRegeneration false
gamerule commandBlockOutput false
gamerule fallDamage false
gamerule spawnRadius 0

bossbar add game "Game"
bossbar set game value 100
bossbar set game color white

team add red
team add blue

team modify red color red
team modify blue color blue
team modify red friendlyFire false
team modify blue friendlyFire false
team modify red nametagVisibility hideForOtherTeams
team modify blue nametagVisibility hideForOtherTeams

team join red Red
team join blue Blue

scoreboard players set red values 0
scoreboard players set blue values 0
scoreboard players set active values 0
scoreboard players set ticks values 1
scoreboard players set seconds values 0