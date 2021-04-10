extends Node2D

export var est_bougeable : bool = true
export var est_tournable : bool = true
export var est_scalable : bool = true
export var electrise : bool = false
export var effets_vent : bool = false
export var obj_friction : float = 1

var debut_electrisation = 0

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
		elif GlobalGame.mode == 2 and est_tournable:
			var d = event.relative
			rotation_degrees += d.y
		elif GlobalGame.mode == 3 and est_scalable:
			scale += event.relative/100

func _on_TouchScreenButton_pressed():
	if not GlobalGame.lance_initial:
		if GlobalGame.is_deleting:
			queue_free()
			GlobalGame.is_deleting = false
		dragging = true

func _process(delta):
	if electrise:
		if get_node("Zone_Electricite"):
			electrise = false
			for child in get_node("Zone_Electricite").get_overlapping_bodies():
				# Pour les matériaux conducteurs
				if child.get_node("Zone_Electricite"):
					child.electrise = true
					child.debut_electrisation = OS.get_ticks_msec()
				# Pour les elements de type moteur
				if child.get("est_moteur"):
					child.lancer()

