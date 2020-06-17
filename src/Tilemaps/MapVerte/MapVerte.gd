extends TileMap

var number_of_ennemies = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	if number_of_ennemies == 0:
		$"nextWave".disabled = false
	else:
		$"nextWave".disabled = true


func _on_nextWave_pressed():
	$Chemin.reload_ennemy_list()
	$Chemin.spawn_next_ennemy()
	$Chemin/ApparitionMobs.start()
	pass # Replace with function body.