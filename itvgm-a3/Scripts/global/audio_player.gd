extends AudioStreamPlayer


const level_music = preload("res://Imports/Music/BackgroundMusic.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = 0.1
	play()

func play_music_level():
	_play_music(level_music)
