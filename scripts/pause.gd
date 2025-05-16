extends Control


@onready var resume = $CenterContainer/VBoxContainer/Resume
@onready var host = get_parent().get_parent()
var count :int = 0


func _ready():
	resume.grab_focus() 
	pass # Replace with function body.


func _on_resume_pressed():
	if host:
		host.resumeGame()


func _on_quit_pressed():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/menu.tscn")



func get_focus():
	resume.grab_focus()
	
