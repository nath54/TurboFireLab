extends Area2D

var last_tick = OS.get_ticks_msec()
var tp_tick = 300

func _ready():
	last_tick = OS.get_ticks_msec()

func _process(delta):
	if OS.get_ticks_msec() - last_tick < tp_tick:
		return
	if get_parent().electrise and get_parent().est_conducteur:
		var compteur = 0
		for body in get_overlapping_bodies():
			# Pour les matériaux conducteurs
			if body.has_node("Zone_Electricite") and body.has_method("is_electrisable") and body.is_electrisable():
				compteur += 1
				body.electrise = true
				body.modulate = Color(0.5,0,1)
			# Pour les elements de type moteur
			if body.has_node("Electronique"):
				print("aaaaaaaaaaaa")
				body.get_node("Electronique").lancer()
				compteur += 1
				# body.lancer()
			if compteur == 2:
				break
		if compteur >= 1:
			get_parent().electrise = false
			get_parent().modulate = Color(1,1,1)
