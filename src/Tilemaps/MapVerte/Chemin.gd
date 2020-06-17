extends Path2D

export (PackedScene) var FirstEnnemy

var ennemy_list
#note : pour les vagues, j'utiliserai des ressources. vidéo : https://www.youtube.com/watch?v=7PhGpMZfEHU

func _ready():
	pass
	
#func _process(delta):

func reload_ennemy_list():
	var ennemy1 = FirstEnnemy.instance()
	var ennemy2 = FirstEnnemy.instance()
	var ennemy3 = FirstEnnemy.instance()
	var ennemy4 = FirstEnnemy.instance()
	var ennemy5 = FirstEnnemy.instance()
	ennemy_list = [ennemy1, ennemy2, ennemy3, ennemy4, ennemy5]

func _on_ApparitionMobs_timeout():
	spawn_next_ennemy()
	
func spawn_next_ennemy():
	get_parent().number_of_ennemies += 1
	var new_ennemy = ennemy_list[0]
	ennemy_list.pop_front()
	self.add_child(new_ennemy)
	if ennemy_list.size() == 0:
		$ApparitionMobs.stop()
