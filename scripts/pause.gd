extends Control


@onready var resume = $CenterContainer/VBoxContainer/Resume
@onready var host = get_parent().get_parent()
var count :int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	resume.grab_focus() 
	pass # Replace with function body.


func _on_resume_pressed():
	print("resume")
	if host:
		host.resumeGame()
	pass # Replace with function body.


func _on_quit_pressed():
	print("quit")
	if host:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/menu.tscn")

func _process( delta :float ):
	#print( count )
	#count += 1
	#if host.paused and Input.is_action_just_pressed("pause"):
		#host.resumeGame()
	pass

func get_focus():
	resume.grab_focus()
	
