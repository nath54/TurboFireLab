extends Node2D

"""
Pour l'instant, on fera que le feu s'éteint directement
quand il touche l'eau, mais on pourra faire qu'il faut
que l'eau reste un temps déterminé minimum pour que le 
feu s'éteigne.
"""

func _on_Area2D_body_entered(body):
	"""
	On définira ici les règles de physique lorsqu'un OBJET
	rentre en collision avec la flamme
	"""

	if body.get("est_eau"):
		get_parent().get_parent().get_parent().test_gagne();
		queue_free();

# partie pour le drag
var dragging = false
var radius = 21
func _input(event):
	if not GlobalGame.lance_initial and event is InputEventMouseButton and event.pressed:
		if global_position.distance_to(get_global_mouse_position()) <= radius:
			if GlobalGame.is_deleting:
				if get_parent().get_child_count() > 1:
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

# Pour enlever les trucs inutiles
func _on_Area2D_body_exited(body):
	body.queue_free()
