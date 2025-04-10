scoreboard objectives add display dummy {"text": "Minigame", "color": "gold", "bold": true}
scoreboard objectives setdisplay sidebar display

scoreboard players set need values $POINTS_NEED$
scoreboard players set point_clock values 0

scoreboard players set owner_display values 0
scoreboard players set capture_display values 0

# Current point owner
scoreboard players set owner_a values 0
scoreboard players set owner_b values 0
scoreboard players set owner_c values 0
# Point capture progress (-20 = blue, 20 = red)
scoreboard players set caputre_a values 0
scoreboard players set capture_b values 0
scoreboard players set capture_c values 0
# Point clock % point rate (when this = 0, give a point to owner)
scoreboard players set tick_a values 0
scoreboard players set tick_b values 0
scoreboard players set tick_c values 0
scoreboard players set mtick_a values $TICKS_A$
scoreboard players set mtick_b values $TICKS_B$
scoreboard players set mtick_c values $TICKS_C$
# Point clock % capture rate (when this = 0, move capture progress towards owner)
scoreboard players set progress_a values 0
scoreboard players set progress_b values 0
scoreboard players set progress_c values 0
scoreboard players set mprogress_a values $CAPTURE_A$
scoreboard players set mprogress_b values $CAPTURE_B$
scoreboard players set mprogress_c values $CAPTURE_C$

scoreboard players set $A_NAME$ display 3
scoreboard players set $B_NAME$ display 2
scoreboard players set $C_NAME$ display 1

team add pointa
team add pointb
team add pointc
team join pointa $A_NAME$
team join pointb $B_NAME$
team join pointc $C_NAME$
