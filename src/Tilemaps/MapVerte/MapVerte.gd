extends TileMap

var number_of_ennemies = 0

func _ready():
	Events.connect("new_ennemy", self, "on_new_ennemy") 
	Events.connect("dead_ennemy", self, "on_dead_ennemy") 


func _process(delta):
	print(str(number_of_ennemies))


func _on_nextWave_pressed():
	$Chemin.next_wave()
	$"nextWave".disabled = true
	
func change_button_text(text):
	$nextWave.text = text

func on_new_ennemy():
	number_of_ennemies += 1

func on_dead_ennemy():
	number_of_ennemies -= 1
	if number_of_ennemies == 0:
		$"nextWave".disabled = false
