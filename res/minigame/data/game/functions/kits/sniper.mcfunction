function game:kits/base
execute if entity @s[team=red] run function game:kits/red
execute if entity @s[team=blue] run function game:kits/blue
item replace entity @s container.27 with tacz:ammo{AmmoId:"tacz:30_06"} 10
item replace entity @s container.28 with tacz:ammo{AmmoId:"tacz:45acp"} 21
give @s tacz:modern_kinetic_gun{GunId:"tacz:m700",GunFireMode:"SEMI",GunCurrentAmmoCount:5,HasBulletInBarrel:1b,AttachmentSCOPE:{id:"tacz:attachment",Count:1b,tag:{AttachmentId:"tacz:scope_acog_ta31"}}}
give @s tacz:modern_kinetic_gun{GunId:"tacz:m1911",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b}
scoreboard players set @s kit 4
scoreboard players set @s kit_sniper 0