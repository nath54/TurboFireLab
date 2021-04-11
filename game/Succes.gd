extends Node

var succes = {
	"en série !": "Faire marcher 3 objets éléctriques avec une seule pile",
	"à l'état gazeux": "éteindre le feu avec la vapeur d'eau",
	"j'ai froid": "éteindre du feu avec un glaçon"
}

var succes_fait = {
	"en série !": false,
	"à l'état gazeux": false,
	"j'ai froid": false
}

func load_succes():
	var save_game = File.new()
	if not save_game.file_exists("user://succes.save"):
		return # Error! We don't have a save to load.
	save_game.open("user://succes.save", File.READ)
	var data = parse_json(save_game.get_line())
	succes_fait = data
	save_game.close()

func save_succes():
	var save_game = File.new()
	save_game.open("user://succes.save", File.WRITE)
	save_game.store_line(to_json(succes_fait))
	save_game.close()

func set_succes(nom_succes):
	if not succes_fait[nom_succes]:
		succes_fait[nom_succes] = true
		save_succes()
		GlobalGame.game.console_mes("Objectif réussi !")
		GlobalGame.game.console_mes(nom_succes + " : " + succes[nom_succes])
		aff_succes()

func get_succes(nom_succes):
	return succes_fait[nom_succes]

func aff_succes():
	var control_aff = GlobalGame.game.get_node("Menus/Console/Succes/ScrollContainer2/Liste_Succes")
	# On nettoie
	for child in control_aff.get_children():
		child.queue_free()
	# On les ecrits
	for key in succes.keys():
		var mes = Label.new()
		mes.text = "- "+key+" : "+succes[key]
		mes.autowrap = true
		mes.rect_min_size = Vector2(800,20)
		if succes_fait[key]:
			mes.modulate = Color(0,1,0)
		mes.add_font_override("font", load("res://res/font/rainyhearts_2.tres"))
		control_aff.add_child(mes)

