extends Area2D

export (int) var speed = 800
var damage = 40

func _ready():
	pass 

func _process(delta):
	var velocity = Vector2(speed*delta, 0)
	position += velocity.rotated(rotation)
	
func start(_pos, target, _damage):
	damage = _damage
	rotation = Vector2(1,0).angle_to((target.position - _pos).normalized())


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
