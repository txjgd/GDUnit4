extends Control


var mix = preload( "res://resources/mix_canvas_material.tres" )
var sub = preload( "res://resources/subtract_canvas_material.tres" )


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed( "ui_left" ):
		GameManager.selected = (GameManager.selected - 1) % 2
		set_selected()
	elif Input.is_action_just_pressed( "ui_right" ):
		GameManager.selected = (GameManager.selected + 1) % 2
		set_selected()

	if Input.is_action_just_pressed( "ui_accept" ):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/GamePlay.tscn")



func set_selected():
	if GameManager.selected == 0:
		$Cat.material = mix
		$Fox.material = sub
		$CharacterName.text = 'Cat'
		pass
	else:
		$Cat.material = sub
		$Fox.material = mix
		$CharacterName.text = 'Fox'
		pass
	pass
