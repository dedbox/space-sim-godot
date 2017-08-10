extends Node2D

const R = 240.0 / 256
const GB_MIN = 96.0 / 256
const GB_MAX = 210.0 / 256
const GB_RATE = (GB_MAX - GB_MIN) * 4

var gb = GB_MIN

func _ready():
	set_process(true)

func _process(delta):
	gb = gb + GB_RATE * delta if gb <= GB_MAX else GB_MIN
	update()

const pos = Vector2(-20 * 50, -10 * 50)
const size = Vector2(256 * 70, 256 * 60)

func _draw():
	draw_rect(Rect2(pos, size), Color(R, gb, gb))
