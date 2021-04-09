extends StaticBody2D


# partie pour le drag
var dragging = false
var radius = 21
func _input(event):
	if $"/root/GlobalGame".lance and event is InputEventMouseButton and event.pressed:
		if global_position.distance_to(get_global_mouse_position()) <= radius:
			dragging = true
	if event is InputEventMouseButton and not event.pressed:
		dragging = false
	if $"/root/GlobalGame".lance and dragging and event is InputEventMouseMotion:
		position += event.relative
