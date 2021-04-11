extends Node

var datas = {
	"0": "L'eau s'électrise en contact de la pile",
	"1":"Les objets électroniques se mettent en mouvement en contact d'eau électrisé",
	"2":"Les ventilateurs déplacent la vapeur d'eau",
	"3":"La vapeur d'eau peut mettre des objets en mouvements",
	"4":"Le briquet peut se renverser",
	"5":"L'électricité conduit dans par le métal vers un objet électronique le met en mouvement",
	"6":"La diminution de température peut refroidir la vapeur d'eau et la transformer en eau",
	"7":"La diminution de température peut refroidir l'eau et la transformer en glace",
	"8":"L'augmentation de température tranforme la glace en eau",
	"9":"Les ventilateurs poussent les objets",
	"10":"Le plastique isole l'électricité",
	"11":"Le métal conduit l'électricité"
}

var datas_fait = {
	"0":false,
	"1":false,
	"2":false,
	"3":false,
	"4":false,
	"5":false,
	"6":false,
	"7":false,
	"8":false,
	"9":false,
	"10":false,
	"11":false
}

func load_data():
	var save_game = File.new()
	if not save_game.file_exists("user://datas.save"):
		return # Error! We don't have a save to load.
	save_game.open("user://datas.save", File.READ)
	var data = parse_json(save_game.get_line())
	datas_fait = data
	save_game.close()

func save_data():
	var save_game = File.new()
	save_game.open("user://datas.save", File.WRITE)
	save_game.store_line(to_json(datas_fait))
	save_game.close()

func set_data(nom_data):
	if not datas_fait[nom_data]:
		datas_fait[nom_data] = true
		save_data()
		GlobalGame.game.console_mes("Data update...")
		GlobalGame.game.console_mes(datas[nom_data])
		aff_data()

func get_data(nom_data):
	return datas_fait[nom_data]

func aff_data():
	var control_aff = GlobalGame.game.get_node("Menus/Console/Data/ScrollContainer3/Data_Messages")
	# On nettoie
	for child in control_aff.get_children():
		child.queue_free()
	# On les ecrits
	var compteur = 0
	for key in datas.keys():
		if datas_fait[key]:
			compteur += 1
			var mes = Label.new()
			mes.text = "- "+datas[key]
			mes.autowrap = true
			mes.rect_min_size = Vector2(800,20)
			mes.add_font_override("font", load("res://res/font/rainyhearts_2.tres"))
			control_aff.add_child(mes)
	if compteur == 0:
			var mes = Label.new()
			mes.text = "Aucune donnée n'a été découverte"
			mes.autowrap = true
			mes.rect_min_size = Vector2(800,20)
			mes.add_font_override("font", load("res://res/font/rainyhearts_2.tres"))
			control_aff.add_child(mes)
		

