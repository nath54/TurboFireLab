extends Control

const SPEED = 10

func _ready():
	$ScrollContainer.rect_position = Vector2(0,0)

func _process(delta):
	$ScrollContainer.rect_position = Vector2(0,$ScrollContainer.rect_position.y - delta * SPEED)
	if $ScrollContainer.rect_position.y < -1770:
		$ScrollContainer.rect_position = Vector2(0,0)

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()

func _on_TextureButton_pressed():
	GlobalGame.niveau_encours = "res://game/maps/Scene.tscn"
	get_tree().change_scene("res://game/game.tscn")
