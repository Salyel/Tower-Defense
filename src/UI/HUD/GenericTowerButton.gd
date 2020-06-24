extends Button

export (PackedScene) var tower
var real_tower

func _ready():
	Events.connect("receive_number_gold", self, "on_receive_number_gold")
	real_tower = tower.instance()
	$Price.text = str(real_tower.price) + " gold"
	self.disabled = true

func on_receive_number_gold(number_gold):
	if (number_gold < real_tower.price):
		self.disabled = true
	else:
		self.disabled = false

func _on_GenericTowerButton_pressed():
	Events.emit_signal("lose_gold", real_tower.price)
