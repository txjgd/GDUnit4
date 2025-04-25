extends CharacterBody2D

@onready var state_machine = $StateMachineComponent
@onready var stun = $StateMachineComponent/StunFoeState

@onready var area_sensor = get_node( 'AreaSenseComponent' )

func take_damage( amt: float ) -> void:
	state_machine.transition_to( stun )

func set_target( who :CharacterBody2D ) -> void:
	if area_sensor:
		area_sensor.target = who


#func _physics_process( delta :float ) -> void:
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#if collision.get_collider().has_method( "is_player" ):
			#var tree = get_tree()
			#if tree:
				#tree.change_scene_to_file("res://scenes/game_over.tscn")

func is_enemy() -> bool :
	return true
