extends Area2D

export var force : Vector2 = Vector2(10,0);

var objets_sous_force = {}
var en_cours = false

func _physics_process(delta):
	if GlobalGame.lance and en_cours:
		for body in get_overlapping_bodies():
			if body.has_method("effet_froid"):
				body.effet_froid()
