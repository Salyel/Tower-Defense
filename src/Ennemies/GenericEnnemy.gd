extends PathFollow2D

export (float) var SPEED = 200
export (int) var hpMax = 50
var hp = hpMax

func _ready():
	get_node("Hp bar").init(self)

func _process(delta):
	offset += SPEED * delta
	hp -= 0.1
	
	if unit_offset >= 1:
		queue_free()
	if hp < 0:
		queue_free()
