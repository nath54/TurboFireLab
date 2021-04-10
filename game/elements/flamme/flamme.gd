extends Node2D


# partie pour le drag
var dragging = false
func _input(event):
	if event is InputEventMouseButton and not event.pressed:
		dragging = false
	if not GlobalGame.lance_initial and dragging and event is InputEventMouseMotion:
		if GlobalGame.mode == 1:
			position += event.relative
		elif GlobalGame.mode == 2:
			var d = event.relative
			rotation_degrees += d.y

func _on_TouchScreenButton_pressed():
	if not GlobalGame.lance_initial:
		if GlobalGame.is_deleting:
			if get_parent().get_child_count() > 1:
					queue_free()
			GlobalGame.is_deleting = false
		dragging = true
