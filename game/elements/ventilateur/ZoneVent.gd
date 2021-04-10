extends Area2D

export var force : Vector2 = Vector2(50,0);

func _physics_process(delta):
	if GlobalGame.lance:
		for body in get_overlapping_bodies():
			if body.get("effets_vent") and body.effets_vent:
				# body.position += sens.rotated(rotation_degrees) * delta
				# body.add_force(position, force*delta)
				body.add_central_force(force*delta)
