extends TileMap

var stars
var void

func _ready():
	var screen = get_viewport_rect()
	stars =  Rect2(0, 0, 256 * 50, 256 * 50)
	void = Rect2(stars.pos - screen.size / 2, stars.size + screen.size)
	
	for y in range(256):
		for x in range(256):
			set_cell(x, y, randi() % 32)
	
	var camera = get_parent().get_node("Ship/Camera")
	camera.set_limit(MARGIN_LEFT, -600)
	camera.set_limit(MARGIN_TOP, -300)
	camera.set_limit(MARGIN_RIGHT, 13400)
	camera.set_limit(MARGIN_BOTTOM, 13100)

func _draw():
	draw_rect(void, Color("#FAAFAF"))