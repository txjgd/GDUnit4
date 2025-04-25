extends Node2D

var player :CharacterBody2D

func init( who :CharacterBody2D ) -> void:
	player = who
	$Mobs/Boss.set_target( who )
