function game:kits/base
execute if entity @s[team=red] run function game:kits/red
execute if entity @s[team=blue] run function game:kits/blue
item replace entity @s container.27 with tacz:ammo{AmmoId:"tacz:556x45"} 60
item replace entity @s container.18 with tacz:ammo{AmmoId:"tacz:556x45"} 30
item replace entity @s container.28 with tacz:ammo{AmmoId:"tacz:45acp"} 28
give @s tacz:modern_kinetic_gun{GunId:"tacz:m4a1",GunFireMode:"AUTO",GunCurrentAmmoCount:30,HasBulletInBarrel:1b}
give @s tacz:modern_kinetic_gun{GunId:"tacz:p320",GunFireMode:"SEMI",GunCurrentAmmoCount:14,HasBulletInBarrel:1b,AttachmentEXTENDED_MAG: {id: "tacz:attachment", Count: 1b, tag: {AttachmentId: "tacz:ammo_mod_hp"}}}
scoreboard players set @s kit 1
scoreboard players set @s kit_assault 0