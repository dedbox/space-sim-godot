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

var blue_laser_scene = preload("res://blue_laser.tscn")
onready var pri_start = get_node("PrimaryWeapon/Start")
onready var pri_end = get_node("PrimaryWeapon/End")

var pri_firing = false
var pri_ready = false
var pri_delta = 1.0

func _ready():
	set_process(true)

func _process(delta):
	pri_delta += delta
	if pri_firing:
		if pri_delta >= 0.1666:
			pri_ready = true
			pri_delta -= 0.1666
		if pri_ready and get_node("../HUD/L1/Bar").get_value() > 0:
			fire_pri()
			pri_ready = false
			pri_delta = 0.0

func start_fire_pri():
	pri_firing = true

func end_fire_pri():
	pri_firing = false

func fire_pri():
	var start = pri_start.get_global_pos()
	var end = pri_end.get_global_pos()
	var bullet = blue_laser_scene.instance()
	bullet.set_global_pos(end)
	bullet.set_global_rot(get_global_rot())
	bullet.dir = (end - start).normalized()
	get_parent().add_child(bullet)
	var bar = get_node("../HUD/L1/Bar")
	bar.set_value(bar.get_value() - 1)  
