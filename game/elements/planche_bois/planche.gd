extends RigidBody2D


func test_collision_with_mouse():
	# return $CollisionShape2D.shape.has_point(get_global_mouse_position())
	return Geometry.is_point_in_polygon(get_global_mouse_position(), $Polygon2D.polygons)

# partie pour le drag
var dragging = false
var radius = 21
func _input(event):
	if event is InputEventMouseButton and not event.pressed:
		dragging = false
	if not GlobalGame.lance and dragging and event is InputEventMouseMotion:
		if GlobalGame.mode == 1:
			position += event.relative
		elif GlobalGame.mode == 2:
			var d = event.relative
			rotation_degrees += d.x + d.y


func _on_TouchScreenButton_pressed():
	if not GlobalGame.lance_initial:
		if GlobalGame.is_deleting:
			queue_free()
			GlobalGame.is_deleting = false
		dragging = true
