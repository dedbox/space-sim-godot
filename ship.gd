extends Sprite

const MAX_SPEED = 500

var pos = get_pos()
var vel = 0
var rad = 0

func travel(delta):
	rotate(rad * delta)
	translate(Vector2(0, -vel * delta).rotated(get_rot()))

func turn_left():
	rad += PI

func turn_right():
	rad -= PI

func thrust_on():
	vel = MAX_SPEED

func brake():
	vel = 0