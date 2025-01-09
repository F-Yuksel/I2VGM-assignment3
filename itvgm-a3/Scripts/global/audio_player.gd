extends AudioStreamPlayer


const level_music = preload("res://Imports/Music/BackgroundMusic.mp3")
const intro_music = preload("res://Imports/Music/Lab-Practicum.mp3")

var current_music: AudioStream = null

func _play_music(music: AudioStream, volume: int):
	# Avoid restarting the same music
	if stream == music:
		return
		
	# Switch to new music
	stream = music
	volume_db = volume
	play()

func play_music_level():
	_play_music(level_music, -24)
	
func play_intromusic():
	_play_music(intro_music, -24)
	
func play_menumusic():
	pass
