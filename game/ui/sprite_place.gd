extends Sprite

var tile = 64
var element = null
var path = "Elements"

func _process(delta):
	var p = get_global_mouse_position()
	var x = p[0]
	var y = p[1]
	# var x = p[0] - int(p[0]) % tile
	# var y = p[1] - int(p[1]) % tile
	position = Vector2(x, y)

func _input(event):
	if event is InputEventMouseButton:
		var i = GlobalGame.img_place.element.instance()
		i.position = position
		get_parent().get_node(path).add_child(i)
		GlobalGame.img_place = null
		GlobalGame.est_placer = false
		queue_free()
