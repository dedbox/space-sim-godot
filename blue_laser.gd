extends Sprite

var dir = Vector2(0, 1)
var distance = 0
var speed = 1000

func _ready():
	set_process(true)

func _process(delta):
	if distance >= 1000:
		hide()
		queue_free()
	else:
		var old_pos = get_pos()
		var new_pos = old_pos + dir * speed * delta
		set_pos(new_pos)
		distance += (new_pos - old_pos).length()
