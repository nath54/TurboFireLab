extends Node

export var temps_timer : int = 8

onready var animsp = get_parent().get_node("AnimatedSprite")

func lancer():
	if not get_parent().get_node("ZoneFroid").en_cours:
		get_parent().get_node("ZoneFroid").en_cours = true
		$Timer.wait_time = temps_timer
		$Timer.start()
		animsp.play("debut")

func arreter():
	get_parent().get_node("ZoneFroid").en_cours = false
	animsp.play("fin")

func _on_Timer_timeout():
	arreter()

func _process(delta):
	if get_parent().electrise:
		if get_parent().nom_objet_electrisant == "eau":
			GlobalGame.game.get_node("Datas").set_data("1")
		get_parent().electrise = false
		lancer()

func _on_AnimatedSprite_animation_finished():
	if animsp.animation == "debut":
		animsp.play("default")
	elif animsp.animation == "default":
		animsp.play("default")
	elif animsp.animation == "fin":
		animsp.stop()
