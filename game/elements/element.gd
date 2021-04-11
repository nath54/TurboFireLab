extends Node2D

export var est_bougeable : bool = true
export var est_tournable : bool = true
export var est_scalable : bool = true
export var est_supprimable : bool = true
export var est_electrisable : bool = false
export var est_conducteur : bool = false
export var electrise : bool = false
export var couleur_electricite : bool = false
export var effets_vent : bool = false
export var obj_friction : float = 1

export var nom_element : String = ""
var nom_objet_electrisant : String = ""

func is_electrisable():
	return est_electrisable

func _ready():
	if get_node(".") is PhysicsBody2D: 
		get_node(".").set_friction(obj_friction)

# partie pour le drag
var dragging = false
func _input(event):
	if event is InputEventMouseButton and not event.pressed:
		dragging = false
	if not GlobalGame.lance and dragging and event is InputEventMouseMotion:
		if GlobalGame.mode == 1 and est_bougeable:
			position += event.relative
			if position.x < 0:
				position.x = 0
			if position.x > GlobalGame.max_x:
				position.x = GlobalGame.max_x
			if position.y < 0:
				position.y = 0
			if position.y > GlobalGame.max_y:
				position.y = GlobalGame.max_y
		elif GlobalGame.mode == 2 and est_tournable:
			var d = event.relative
			rotation_degrees += d.y
		elif GlobalGame.mode == 3 and est_scalable:
			scale += event.relative/100

func _on_TouchScreenButton_pressed():
	if not GlobalGame.lance_initial:
		if GlobalGame.is_deleting and est_supprimable:
			queue_free()
			GlobalGame.is_deleting = false
		dragging = true
