extends Sprite

const MAX_SPEED = 500

var pos = get_pos()
var vel = 0
var rot = 0

func travel(delta):
	rotate(rot * delta)
	translate(Vector2(0, -vel * delta).rotated(get_rot()))

func turn_left():
	rot += PI

func turn_right():
	rot -= PI

func thrust_on():
	vel = MAX_SPEED

func brake():
	vel = 0