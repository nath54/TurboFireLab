extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("splash_screen")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://menus/MainMenu.tscn")
