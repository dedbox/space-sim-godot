extends TileMap

func _ready():
	for y in range(256):
		for x in range(256):
			set_cell(x, y, randi() % 32)