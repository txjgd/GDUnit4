extends Control

var countdown = 3
@onready var tlabel = $CenterContainer2/Count
@onready var slabel = $CenterContainer/VBoxContainer/Score

func _ready():
	slabel.text = "Score: " + str( GameManager.final_score )
	$Timer.start()
	


func _on_timer_timeout():
	countdown -= 1
	tlabel.text = str( countdown )
	
	if countdown > 0:
		$Timer.start()
	else:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/GamePlay.tscn")
		
	pass # Replace with function body.
