extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var scene = PackedScene.new()

func save_beginning():
	var scene_root = get_node(".")
	# _set_owner(scene_root, scene_root)
	scene.pack(scene_root)

	

func _on_Zone_dexistence_body_exited(body):
	body.queue_free()
