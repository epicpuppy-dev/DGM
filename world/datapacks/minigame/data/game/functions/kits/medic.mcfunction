function game:kits/base
execute if entity @s[team=red] run function game:kits/red
execute if entity @s[team=blue] run function game:kits/blue
item replace entity @s container.28 with tacz:ammo{AmmoId:"tacz:45acp"} 42
give @s tacz:modern_kinetic_gun{GunId:"tacz:p320",GunFireMode:"SEMI",GunCurrentAmmoCount:14,HasBulletInBarrel:1b,AttachmentEXTENDED_MAG: {id: "tacz:attachment", Count: 1b, tag: {AttachmentId: "tacz:ammo_mod_hp"}}}
give @s splash_potion{CustomPotionColor:11546150,CustomPotionEffects:[{Id:10,Duration:300,Amplifier:2}],display:{Name:'["",{"text":"Splash Health Pack","italic":false}]'}} 3