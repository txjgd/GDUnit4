extends Node2D

var total_gathered :int = 0

var remaining :int = 0

@onready var hud_count = $CanvasLayer/HUD/Count
@onready var hud_score = $CanvasLayer/HUD/Score
@onready var pause = $PauseLayer/Pause

var cat_char = preload( "res://objects/cat.tscn" ) 
var fox_char = preload( "res://objects/fox.tscn" )

var character :CharacterBody2D


func _ready():
	var old = $Player
	if GameManager.selected == 0:
		var cat = cat_char.instantiate() as CharacterBody2D
		cat.name = 'Player'
		$Player.replace_by( cat )
		character = cat
	else:
		var fox = fox_char.instantiate() as CharacterBody2D
		fox.name = 'Player'
		$Player.replace_by( fox )
		character = fox
		
	old.free()
	
	GameManager.next_map()
	pass # Replace with function body.


func _process( delta :float ):
	if Input.is_action_just_pressed( "pause" ):
		pauseGame()
		pass


func add_amount_to_gather( amt :int ) -> void:
	remaining += amt
	hud_count.text = str( remaining )


func note_item_picked_up( time :float ):
	remaining -= 1
	total_gathered += 1
	GameManager.score += clamp( 100 - (time * 10), 5, 100 )
	hud_count.text = str( remaining )
	hud_score.text = str( GameManager.score )
	
	if remaining == 0:
		get_tree().call_deferred( "change_scene_to_file", "res://scenes/get_ready.tscn" )
		#GameManager.next_map()

func setup_map():
	var map = $Map.get_child( 0 )
	map.init( character )
	
	var launch = character.get_node( 'LaunchComponent' )
	if launch:
		var projs = map.get_node( 'Projectiles' )
		if projs:
			launch.container = projs
		else:
			print( 'Error! Map needs a "Projectiles" Node')
			

func pauseGame():
	print("pausing...")
	pause.show()
	$Map.process_mode = Node.PROCESS_MODE_DISABLED
	$Player.process_mode = Node.PROCESS_MODE_DISABLED
	$CanvasLayer.process_mode = Node.PROCESS_MODE_DISABLED
	pause.get_focus()


func resumeGame():
	print("resuming...")
	pause.hide()
	$Map.process_mode = Node.PROCESS_MODE_INHERIT
	$Player.process_mode = Node.PROCESS_MODE_INHERIT
	$CanvasLayer.process_mode = Node.PROCESS_MODE_INHERIT
	#get_tree().paused = false
