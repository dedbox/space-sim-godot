extends TileMap

func _ready():
	for y in range(256):
		for x in range(256):
			set_cell(x, y, randi() % 32)
	
	var camera = get_parent().get_node("Ship/Camera")
	camera.set_limit(MARGIN_LEFT, -600)
	camera.set_limit(MARGIN_TOP, -300)
	camera.set_limit(MARGIN_RIGHT, 13400)
	camera.set_limit(MARGIN_BOTTOM, 13100)
