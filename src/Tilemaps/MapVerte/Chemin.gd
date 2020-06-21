extends Path2D

export (PackedScene) var FirstEnnemy
export (Resource) var vague
var number_generics = 0
var numero_vague = 1

var ennemy_list = []

func _ready():
	reload_ennemy_list()
	
#func _process(delta):

func reload_ennemy_list():
	for i in range (0, number_generics):
		var ennemy = FirstEnnemy.instance()
		ennemy_list.append(ennemy)
	ennemy_list.shuffle()

func _on_ApparitionMobs_timeout():
	spawn_next_ennemy()
	
func spawn_next_ennemy():
	Events.emit_signal("new_ennemy")
	var new_ennemy = ennemy_list[0]
	ennemy_list.pop_front()
	self.add_child(new_ennemy)
	if ennemy_list.size() == 0:
		$ApparitionMobs.stop()

func next_wave():
	vague = load("res://assets/resources/vagues/Vague" + str(numero_vague) + ".tres")
	number_generics = vague.generic
	numero_vague += 1
	reload_ennemy_list()
	spawn_next_ennemy()
	var text = "Vague suivante ! (Vague " + str(numero_vague) + ")"
	get_parent().change_button_text(text)
	$ApparitionMobs.start()
