extends PathFollow2D

export (float) var SPEED = 200

func _process(delta):
	offset += SPEED * delta
	
	if unit_offset >= 1:
		queue_free()
