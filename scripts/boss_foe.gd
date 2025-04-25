extends CharacterBody2D

@onready var state_machine = $StateMachineComponent
@onready var stun = $StateMachineComponent/StunFoeState

@onready var area_sensor = get_node( 'AreaSenseComponent' )


func take_damage( amt: float ) -> void:
	pass

func set_target( who :CharacterBody2D ) -> void:
	if area_sensor:
		area_sensor.target = who
		$StateMachineComponent/ChasingAnywhereFoeState.target = who
		

func is_enemy() -> bool :
	return true


func _on_hurtbox_body_entered(body):
	pass # Replace with function body.
