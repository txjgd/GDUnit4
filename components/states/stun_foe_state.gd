class_name StunFoeState
extends StateComponent

@export var animations :AnimationPlayer
@export var idle :IdleFoeState
@export var action :StateComponent
@export var stun_time :float = 5
@export var stunsfx  :AudioStreamPlayer2D
@export var bonksfx  :AudioStreamPlayer2D

var cooldown :float = 0

func enter( prev :StateComponent ) -> void:
	cooldown = stun_time
	#host.get_node("Angry").visible = false
	#host.get_node("Shock").visible = false
	animations.stop()
	animations.play( "shake" )
	if bonksfx:
		bonksfx.play()
	if stunsfx:
		stunsfx.play()


func running( delta :float ) -> StateComponent:
	cooldown -= delta
	if cooldown < 0:
		return action
	
	return null
