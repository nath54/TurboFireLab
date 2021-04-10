extends Area2D

export var force : Vector2 = Vector2(50,0);

var objets_sous_force = {}

func _physics_process(delta):
	if GlobalGame.lance:
		for body in get_overlapping_bodies():
			if body.get("effets_vent") and body.effets_vent and not body in objets_sous_force.keys():
				# body.position += sens.rotated(rotation_degrees) * delta
				# body.add_force(position, force*delta)
				body.add_central_force(force)
				objets_sous_force[body] = force

func _on_ZoneVent_body_exited(body):
	if body in objets_sous_force.keys():
		body.add_central_force(-objets_sous_force[body])
		objets_sous_force.erase(body)
