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
		if(possible_position(event.position) && waiting_click == true):
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
