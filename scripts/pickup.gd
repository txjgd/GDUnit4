extends Area2D

@export var spawner :SpawnerComponent


func _on_body_entered(body):
	hide()
	$SFX.play()
	await $SFX.finished
	spawner.picked_up( self )
