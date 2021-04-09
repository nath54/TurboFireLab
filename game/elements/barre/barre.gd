extends StaticBody2D


func test_collision_with_mouse():
	return Geometry.is_point_in_polygon(get_global_mouse_position(), $Polygon2D.polygon)

# partie pour le drag
var dragging = false
var radius = 21
func _input(event):
	if GlobalGame.lance_initial and event is InputEventMouseButton and event.pressed:
		if test_collision_with_mouse():
			dragging = true
	if event is InputEventMouseButton and not event.pressed:
		dragging = false
	if GlobalGame.lance and dragging and event is InputEventMouseMotion:
		position += event.relative
