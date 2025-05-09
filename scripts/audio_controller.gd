extends Node

var current_track :int = -1

func stop_bgm():
	if current_track == 0:
		$bgm1.stop()
	elif current_track == 1:
		$bgm2.stop()
	
	current_track = -1

func play_bgm( track :int ):
	# Do nothing, if we're already playing that track
	if current_track == track:
		return
	
	stop_bgm()
	
	if track == 0:
		$bgm1.play()
	elif track == 1:
		$bgm2.play()
		
	current_track = track
