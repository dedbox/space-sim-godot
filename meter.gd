extends ProgressBar

var elapsed = 0.0

func _ready():
	set_process(true)

func _process(delta):
	elapsed += delta
	if elapsed >= 1.0:
		set_value(min(get_value() + 1, 100))
		elapsed -= 1.0
