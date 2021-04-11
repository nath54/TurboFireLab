extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("splash_screen")

func _on_AnimationPlayer_animation_finished(anim_name):
	# TODO : charger si le tuto a été fini
	if false:
		GlobalGame.niveau_encours = "res://game/maps/Niveau_1.tscn"
	else:
		GlobalGame.niveau_encours = "res://game/maps/Scene.tscn"
	get_tree().change_scene("res://game/game.tscn")
