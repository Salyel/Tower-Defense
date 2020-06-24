extends Area2D

export (PackedScene) var projectile
export (int) var price
var target = null
var priority_list = []
var damage = 40

func _ready():
	pass

func _process(delta):
	pass

func shoot():
	#target.damage(40)
	var projec = projectile.instance()
	projec.start(global_position, target, damage)
	self.add_child(projec)

func choose_target():
	if (len(priority_list) > 0):
		target = priority_list[0]
		$ShootTimer.start()

func _on_range_area_entered(area):
	if (area.get_parent().is_in_group("ennemy")):
		priority_list.append(area.get_parent())
		area.get_parent().tower_focusing.append(self)
		if (target == null):
			$ShootTimer.start()
			target = area.get_parent()

func _on_range_area_exited(area):
	if (area.get_parent().is_in_group("ennemy")):
		priority_list.remove(priority_list.find(area.get_parent()))
		area.get_parent().tower_focusing.append(self)
		if (target == area.get_parent()):
			$ShootTimer.stop()
			target = null
		choose_target()

func _on_ShootTimer_timeout():
	shoot()
