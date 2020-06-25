extends TileMap

var number_of_ennemies = 0

func _ready():
	Events.connect("new_ennemy", self, "on_new_ennemy") 
	Events.connect("dead_ennemy", self, "on_dead_ennemy") 
	Events.connect("add_tower", self, "on_add_tower")

func _on_nextWave_pressed():
	$Chemin.next_wave()
	$"nextWave".disabled = true

func on_add_tower(tower):
	self.add_child(tower)
	
func change_button_text(text):
	$nextWave.text = text

func on_new_ennemy():
	number_of_ennemies += 1

func on_dead_ennemy():
	number_of_ennemies -= 1
	if number_of_ennemies == 0:
		$"nextWave".disabled = false

func possible_position(position):
	if position.y > 150 && position.x > 20:
		if position.y > 1800:
			return true
		if position.y > 360 && position.x < 470:
			return true
		if position.x > 1450 && position.y > 360:
			return true
		if position.y < 730 && position.x > 740 && position.x < 1180:
			return true
	else:
		return false
