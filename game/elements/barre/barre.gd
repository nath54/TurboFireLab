extends StaticBody2D


func test_collision_with_mouse():
	# return $CollisionShape2D.shape.has_point(get_global_mouse_position())
	return Geometry.is_point_in_polygon(get_global_mouse_position(), $Polygon2D.polygon)

# partie pour le drag
var dragging = false
var radius = 21
func _input(event):
	if not GlobalGame.lance_initial and event is InputEventMouseButton and event.pressed:		
		if test_collision_with_mouse():
			if GlobalGame.is_deleting:
				if get_parent().get_child_count() > 1:
					queue_free()
				GlobalGame.is_deleting = false
			dragging = true
	if event is InputEventMouseButton and not event.pressed:
		dragging = false
	if not GlobalGame.lance and dragging and event is InputEventMouseMotion:
		position += event.relative
