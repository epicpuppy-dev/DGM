function game:kits/base
execute if entity @s[team=red] run function game:kits/red
execute if entity @s[team=blue] run function game:kits/blue
effect give @s slowness infinite 0 true
item replace entity @s container.27 with tacz:ammo{AmmoId:"tacz:40mm"} 6
item replace entity @s container.18 with tacz:ammo{AmmoId:"tacz:40mm"} 2
item replace entity @s container.28 with tacz:ammo{AmmoId:"tacz:45acp"} 21
give @s tacz:modern_kinetic_gun{GunId:"tacz:m320",GunFireMode:"SEMI",GunCurrentAmmoCount:1}
give @s tacz:modern_kinetic_gun{GunId:"tacz:m1911",GunFireMode:"SEMI",GunCurrentAmmoCount:7,HasBulletInBarrel:1b}