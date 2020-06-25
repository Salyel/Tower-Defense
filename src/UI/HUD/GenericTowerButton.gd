extends Button

export (PackedScene) var tower
var real_tower
var waiting_click = false

func _ready():
	Events.connect("receive_number_gold", self, "on_receive_number_gold")
	real_tower = tower.instance()
	$Price.text = str(real_tower.price) + " gold"
	self.disabled = true

func _input(event):
	if event is InputEventMouseButton:
		if(waiting_click == true):
			waiting_click = false
			var toweru = tower.instance()
			toweru.position = event.position 
			Events.emit_signal("add_tower", toweru)
			self.add_child(toweru)
			
			Events.emit_signal("lose_gold", real_tower.price)
		

func on_receive_number_gold(number_gold):
	if (number_gold < real_tower.price):
		self.disabled = true
	else:
		self.disabled = false

func _on_GenericTowerButton_pressed():
	waiting_click = true
	self.disabled = true
	#self.Icon = real_tower.get_node("Sprite").texture.load_path
	#var toweru = tower.instance()
	#self.add_child(toweru)
