extends TileMap

var number_of_ennemies = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if number_of_ennemies == 0:
		$"nextWave".disabled = false


func _on_nextWave_pressed():
	pass # Replace with function body.
