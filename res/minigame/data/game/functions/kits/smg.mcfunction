function game:kits/base
execute if entity @s[team=red] run function game:kits/red
execute if entity @s[team=blue] run function game:kits/blue
item replace entity @s container.27 with tacz:ammo{AmmoId:"tacz:45acp"} 50
item replace entity @s container.28 with tacz:ammo{AmmoId:"tacz:45acp"} 25
give @s tacz:modern_kinetic_gun{GunId:"tacz:ump45",GunFireMode:"AUTO",GunCurrentAmmoCount:25,HasBulletInBarrel:1b}
give @s tacz:modern_kinetic_gun{GunId:"tacz:m1911",GunFireMode:"SEMI",GunCurrentAmmoCount:8}
scoreboard players set @s kit 3
scoreboard players set @s kit_smg 0