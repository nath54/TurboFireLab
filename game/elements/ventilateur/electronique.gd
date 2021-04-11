extends Node

export var temps_timer : int = 8

func _ready():
	print("jkhkjh", get_parent().has_node("Electronique"))

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
		get_parent().electrise = false
		lancer()
