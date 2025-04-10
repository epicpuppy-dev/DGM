bossbar set game players @a
bossbar set game name ["",{"text":"Blue ","bold":true,"color":"blue"},{"score":{"name":"blue","objective":"values"},"color":"white"},{"text":"/","color":"dark_gray"},{"score":{"name":"need","objective":"values"},"color":"gray"},{"text":" | ","color":"black"},{"text":"Red ","bold":true,"color":"red"},{"score":{"name":"red","objective":"values"},"color":"white"},{"text":"/","color":"dark_gray"},{"score":{"name":"need","objective":"values"},"color":"gray"}]

execute if score owner_a values matches 1 run team modify pointa color red
execute if score owner_a values matches 0 run team modify pointa color white
execute if score owner_a values matches -1 run team modify pointa color blue
execute if score owner_b values matches 1 run team modify pointb color red
execute if score owner_b values matches 0 run team modify pointb color white
execute if score owner_b values matches -1 run team modify pointb color blue
execute if score owner_c values matches 1 run team modify pointc color red
execute if score owner_c values matches 0 run team modify pointc color white
execute if score owner_c values matches -1 run team modify pointc color blue

execute if score owner_a values matches 1 if score capture_a values matches 16..20 run team modify pointa prefix ["",{"text":"█","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_a values matches 1 if score capture_a values matches 11..15 run team modify pointa prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_a values matches 1 if score capture_a values matches 6..10 run team modify pointa prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_a values matches 1 if score capture_a values matches 1..5 run team modify pointa prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_a values matches 0 if score capture_a values matches 15..19 run team modify pointa prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_a values matches 0 if score capture_a values matches 10..14 run team modify pointa prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_a values matches 0 if score capture_a values matches 5..9 run team modify pointa prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_a values matches 0 if score capture_a values matches -4..4 run team modify pointa prefix ["",{"text":"⃞","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_a values matches 0 if score capture_a values matches -9..-5 run team modify pointa prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_a values matches 0 if score capture_a values matches -14..-10 run team modify pointa prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_a values matches 0 if score capture_a values matches -19..-15 run team modify pointa prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_a values matches -1 if score capture_a values matches -20..-16 run team modify pointa prefix ["",{"text":"█","color":"white"},{"text":"Point ","color":"blue"}]
execute if score owner_a values matches -1 if score capture_a values matches -15..-11 run team modify pointa prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"blue"}]
execute if score owner_a values matches -1 if score capture_a values matches -10..-6 run team modify pointa prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"blue"}]
execute if score owner_a values matches -1 if score capture_a values matches -5..-1 run team modify pointa prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"blue"}]

execute if score owner_b values matches 1 if score capture_b values matches 16..20 run team modify pointb prefix ["",{"text":"█","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_b values matches 1 if score capture_b values matches 11..15 run team modify pointb prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_b values matches 1 if score capture_b values matches 6..10 run team modify pointb prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_b values matches 1 if score capture_b values matches 1..5 run team modify pointb prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"red"}]
execute if score owner_b values matches 0 if score capture_b values matches 15..19 run team modify pointb prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_b values matches 0 if score capture_b values matches 10..14 run team modify pointb prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_b values matches 0 if score capture_b values matches 5..9 run team modify pointb prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_b values matches 0 if score capture_b values matches -4..4 run team modify pointb prefix ["",{"text":"⃞","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_b values matches 0 if score capture_b values matches -9..-5 run team modify pointb prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_b values matches 0 if score capture_b values matches -14..-10 run team modify pointb prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_b values matches 0 if score capture_b values matches -19..-15 run team modify pointb prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"white"}]
execute if score owner_b values matches -1 if score capture_b values matches -20..-16 run team modify pointb prefix ["",{"text":"█","color":"white"},{"text":"Point ","color":"blue"}]
execute if score owner_b values matches -1 if score capture_b values matches -15..-11 run team modify pointb prefix ["",{"text":"▓","color":"white"},{"text":"Point ","color":"blue"}]
execute if score owner_b values matches -1 if score capture_b values matches -10..-6 run team modify pointb prefix ["",{"text":"▒","color":"white"},{"text":"Point ","color":"blue"}]
execute if score owner_b values matches -1 if score capture_b values matches -5..-1 run team modify pointb prefix ["",{"text":"░","color":"white"},{"text":"Point ","color":"blue"}]

execute if score owner_c values matches 1 if score capture_c values matches 16..20 run team modify pointc prefix ["",{"text":"█","color":"white"},{"text":"","color":"red"}]
execute if score owner_c values matches 1 if score capture_c values matches 11..15 run team modify pointc prefix ["",{"text":"▓","color":"white"},{"text":"","color":"red"}]
execute if score owner_c values matches 1 if score capture_c values matches 6..10 run team modify pointc prefix ["",{"text":"▒","color":"white"},{"text":"","color":"red"}]
execute if score owner_c values matches 1 if score capture_c values matches 1..5 run team modify pointc prefix ["",{"text":"░","color":"white"},{"text":"","color":"red"}]
execute if score owner_c values matches 0 if score capture_c values matches 15..19 run team modify pointc prefix ["",{"text":"▓","color":"white"},{"text":"","color":"white"}]
execute if score owner_c values matches 0 if score capture_c values matches 10..14 run team modify pointc prefix ["",{"text":"▒","color":"white"},{"text":"","color":"white"}]
execute if score owner_c values matches 0 if score capture_c values matches 5..9 run team modify pointc prefix ["",{"text":"░","color":"white"},{"text":"","color":"white"}]
execute if score owner_c values matches 0 if score capture_c values matches -4..4 run team modify pointc prefix ["",{"text":"⃞","color":"white"},{"text":"","color":"white"}]
execute if score owner_c values matches 0 if score capture_c values matches -9..-5 run team modify pointc prefix ["",{"text":"░","color":"white"},{"text":"","color":"white"}]
execute if score owner_c values matches 0 if score capture_c values matches -14..-10 run team modify pointc prefix ["",{"text":"▒","color":"white"},{"text":"","color":"white"}]
execute if score owner_c values matches 0 if score capture_c values matches -19..-15 run team modify pointc prefix ["",{"text":"▓","color":"white"},{"text":"","color":"white"}]
execute if score owner_c values matches -1 if score capture_c values matches -20..-16 run team modify pointc prefix ["",{"text":"█","color":"white"},{"text":"","color":"blue"}]
execute if score owner_c values matches -1 if score capture_c values matches -15..-11 run team modify pointc prefix ["",{"text":"▓","color":"white"},{"text":"","color":"blue"}]
execute if score owner_c values matches -1 if score capture_c values matches -10..-6 run team modify pointc prefix ["",{"text":"▒","color":"white"},{"text":"","color":"blue"}]
execute if score owner_c values matches -1 if score capture_c values matches -5..-1 run team modify pointc prefix ["",{"text":"░","color":"white"},{"text":"","color":"blue"}]