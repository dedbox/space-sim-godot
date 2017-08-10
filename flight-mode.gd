extends Node2D

var ship

func _ready():
	ship = get_node("Ship")
	set_process(true)
	set_process_input(true)

func _process(delta):
	ship.travel(delta)

func _input(event):
	if event.is_action_pressed("ui_left"):
		ship.turn_left()
	if event.is_action_released("ui_left"):
		ship.turn_right()
	if event.is_action_pressed("ui_right"):
		ship.turn_right()
	if event.is_action_released("ui_right"):
		ship.turn_left()
	if event.is_action("ui_up"):
		ship.thrust_on()
	if event.is_action("ui_down"):
		ship.brake()
	if event.is_action_pressed("ui_accept"):
		ship.start_fire_pri()
	if event.is_action_released("ui_accept"):
		ship.end_fire_pri()