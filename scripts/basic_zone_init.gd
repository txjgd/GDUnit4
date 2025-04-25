extends Node2D



func init( who :CharacterBody2D ) -> void:
	var mobs = $Mobs.get_children()
	
	for m in mobs:
		m.set_target( who )
