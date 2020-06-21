extends PathFollow2D

export (float) var SPEED = 200
export (int) var hpMax = 500
var hp = hpMax
var tower_focusing = []
var alive = true

func _ready():
	get_node("Hp bar").init(self)

func _process(delta):
	offset += SPEED * delta 
	#damage(0.5)

func _on_VisibilityNotifier2D_screen_exited():
	damage(1000000000)

func damage(amount):
	hp -= amount
	if hp <= 0:
		if alive == true:             #pour que ça s'active pas plusieurs fois quand y'a plusieurs tourelles
			Events.emit_signal("dead_ennemy")
			alive = false
			for tower in tower_focusing:
				if (tower.target == self):
					tower.target = null
					tower.get_node("ShootTimer").stop()
				tower.priority_list.remove(tower.priority_list.find(self))
			queue_free()


func _on_hitbox_area_entered(area):
	if (area.is_in_group("projectiles")):
		damage(area.damage)
		area.queue_free()
