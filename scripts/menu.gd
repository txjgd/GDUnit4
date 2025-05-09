extends Control

func _ready():
	print("Hello World")
	$CenterContainer/VBoxContainer/Subtitle.text = "Hello World"
	GameManager.reset_score()
	AudioController.stop_bgm()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed( "ui_accept" ):
		get_tree().call_deferred( "change_scene_to_file", "res://scenes/character_select.tscn" )
		#get_tree().call_deferred("change_scene_to_file", "res://scenes/GamePlay.tscn")
		#get_tree().change_scene_to_file( "res://scenes/GamePlay.tscn" )
