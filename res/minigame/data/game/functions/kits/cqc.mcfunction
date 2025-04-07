function game:kits/base
execute if entity @s[team=red] run function game:kits/red
execute if entity @s[team=blue] run function game:kits/blue
item replace entity @s container.27 with tacz:ammo{AmmoId:"tacz:12g"} 18
item replace entity @s container.28 with tacz:ammo{AmmoId:"tacz:45acp"} 21
give @s tacz:modern_kinetic_gun{GunId:"tacz:m870",GunFireMode:"SEMI",GunCurrentAmmoCount:6,HasAmmoInBarrel:1b,AttachmentEXTENDED_MAG: {id: "tacz:attachment", Count: 1b, tag: {AttachmentId: "tacz:ammo_mod_hp"}}}
give @s tacz:modern_kinetic_gun{GunId:"tacz:m1911",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b}
scoreboard players set @s kit 2
scoreboard players set @s kit_cqc 0