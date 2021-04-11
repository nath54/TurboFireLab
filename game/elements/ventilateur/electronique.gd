extends Node

export var temps_timer : int = 8
onready var ansprite = get_parent().get_node("AnimatedSprite")

func lancer():
	if not get_parent().get_node("ZoneVent").en_cours:
		get_parent().get_node("ZoneVent").en_cours = true
		get_parent().get_node("AnimatedSprite").playing = true
		$Timer.wait_time = temps_timer
		$Timer.start()

func arreter():
	get_parent().get_node("ZoneVent").en_cours = false
	get_parent().get_node("AnimatedSprite").playing = false

func _on_Timer_timeout():
	arreter()

func _process(delta):
	if get_parent().electrise:
		if get_parent().nom_objet_electrisant == "eau":
			GlobalGame.game.get_node("Datas").set_data("1")
		get_parent().electrise = false
		lancer()
