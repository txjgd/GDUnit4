extends Node

var score :int = 0

var maps = [
	"res://scenes/zone1.tscn",
	"res://scenes/zone2.tscn",
	"res://scenes/boss_zone1.tscn",
	"res://scenes/zone3.tscn",
	]

var bosses = [2]

var current_map :int = 0

var selected = 0

func _ready():
	print( maps.size() )
	pass


func load_map( which :int ) -> void:
	var map_container = get_tree().get_first_node_in_group( "map_container" )

	var scene = load( maps[which] ) as PackedScene
	if !scene:
		return

	# erase the old map
	for child in map_container.get_children():
		child.queue_free()
		await child.tree_exited
	
	# add the new map
	var map = scene.instantiate()
	map_container.add_child( map )
	var gp = get_tree().get_first_node_in_group( 'game_play_group' )
	gp.setup_map()

	print("map added")
	
func next_map():
	if current_map >= maps.size():
		var tree = get_tree()
		if tree:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/game_win.tscn")
			#tree.change_scene_to_file( "res://scenes/game_win.tscn" )
		return
	
	print("Loading map ", current_map )
	load_map( current_map )
	if bosses.find( current_map ) == -1:
		AudioController.play_bgm(0)
	else:
		AudioController.play_bgm(1)

	current_map += 1

func game_over() -> void:
	var tree = get_tree()
	GameManager.selected = 0
	if tree:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/game_over.tscn")
		#tree.change_scene_to_file("res://scenes/game_over.tscn")

func reset_score() -> void:
	score = 0
	current_map = 0
