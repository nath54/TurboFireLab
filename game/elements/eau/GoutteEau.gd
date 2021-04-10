extends Node2D

# partie pour le drag
var dragging = false
var radius = 21
func _input(event):
	if not GlobalGame.lance_initial and event is InputEventMouseButton and event.pressed:
		if global_position.distance_to(get_global_mouse_position()) <= radius:
			if GlobalGame.is_deleting:
				queue_free()
				GlobalGame.is_deleting = false
			dragging = true
	if event is InputEventMouseButton and not event.pressed:
		dragging = false
	if not GlobalGame.lance_initial and dragging and event is InputEventMouseMotion:
		if GlobalGame.mode == 1:
			position += event.relative
		elif GlobalGame.mode == 2:
			var d = event.relative
			rotation_degrees += d.y

