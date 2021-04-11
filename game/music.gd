extends AudioStreamPlayer

var music_actu = null
var loop = false
var on_finished : FuncRef = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func jouer(music, loop=true, on_finished=null):
	stream = load(music)
	loop = true
	play()
	on_finished = on_finished

func sfx(son):
	$Effets.stream = load(son)
	$Effets.play()

func _on_Music_finished():
	if loop:
		play()
	else:
		if on_finished != null:
			on_finished.call_func()
	
