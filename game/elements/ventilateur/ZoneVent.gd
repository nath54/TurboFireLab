extends Area2D

export var force : Vector2 = Vector2(10,0);

var objets_sous_force = {}
var en_cours = false

func _physics_process(delta):
	if GlobalGame.lance and en_cours:
		for body in get_overlapping_bodies():
			if body.get("effets_vent") and body.effets_vent:# and not body in objets_sous_force.keys():
				if body.nom_element == "vapeur":
					GlobalGame.game.get_node("Datas").set_data("2")
				# body.position += sens.rotated(rotation_degrees) * delta
				# body.add_force(position, force*delta)
				var fr = force.rotated(get_parent().rotation)
				# print(get_parent().rotation, force, fr)
				body.apply_central_impulse(fr)
				objets_sous_force[body] = force

func _on_ZoneVent_body_exited(body):
	if body in objets_sous_force.keys():
		# body.apply_central_impulse(-objets_sous_force[body])
		objets_sous_force.erase(body)
