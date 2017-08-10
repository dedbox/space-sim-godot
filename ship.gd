extends Sprite

func _ready():
	set_process(true)

func _process(delta):
	try_fire_pri(delta)

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

var blue_laser_scene = preload("res://blue_laser.tscn")
onready var pri_start = get_node("PrimaryWeapon/Start")
onready var pri_end = get_node("PrimaryWeapon/End")

var is_firing_pri = false
var last_fire_pri = 9999.0

func try_fire_pri(delta):
	last_fire_pri += delta
	if is_firing_pri:
		if last_fire_pri > 333.0:
			fire_pri() 

func fire_pri():
	var bullet = blue_laser_scene.instance()
	bullet.set_global_pos(pri_end.get_global_pos())
	bullet.set_global_rot(get_global_rot())
	get_parent().add_child(bullet)

func start_fire_pri():
	is_firing_pri = true
	last_fire_pri = 9999.0

func end_fire_pri():
	is_firing_pri = false
