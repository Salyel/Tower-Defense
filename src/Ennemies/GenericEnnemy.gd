extends PathFollow2D

export (float) var SPEED = 300
export (int) var hpMax = 500
var hp = hpMax

func _ready():
	get_node("Hp bar").init(self)

func _process(delta):
	offset += SPEED * delta 
	hp -= 0.1
	
	if hp <= 0:
		get_parent().get_parent().number_of_ennemies -= 1
		queue_free()
		
func _on_VisibilityNotifier2D_screen_exited():
	hp = 0
