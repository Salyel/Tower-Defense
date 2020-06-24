extends Control

var HpMax = 10
var current_hp = HpMax
var gold = 0

func _ready():
	Events.connect("losing_hp", self, "on_losing_hp")
	Events.connect("gain_gold", self, "on_gain_gold")
	Events.connect("lose_gold", self, "on_lose_gold")
	$HpLeft.text = str(current_hp) + " / " + str(HpMax)
	
func on_losing_hp():
	current_hp -= 1
	$HpLeft.text = str(current_hp) + " / " + str(HpMax)

func on_gain_gold(value):
	gold += value
	$NumberOfGold.text = _format(gold)
	Events.emit_signal("receive_number_gold", gold)

func on_lose_gold(value):
	gold -= value
	$NumberOfGold.text = _format(gold)
	Events.emit_signal("receive_number_gold", gold)
	
func _format(value):
	if (value < 1000):
		return str(round(value))
	elif (value < 10000):
		return str(stepify(round(value)/1000,0.01)) + "K"
	elif (value < 100000):
		return str(stepify(round(value)/1000,0.1)) + "K"
	elif (value < 1000000):
		return str(stepify(round(value)/1000,1)) + "K"
	elif (value < 10000000):
		return str(stepify(round(value)/1000000,0.01)) + "M"
	elif (value < 100000000):
		return str(stepify(round(value)/1000000,0.1)) + "M"
	elif (value < 1000000000):
		return str(stepify(round(value)/1000000,1)) + "M"
	elif (value < 10000000000):
		return str(stepify(round(value)/1000000000,0.01)) + "G"
	elif (value < 100000000000):
		return str(stepify(round(value)/1000000000,0.1)) + "G"
	elif (value < 1000000000000):
		return str(stepify(round(value)/1000000000,1)) + "G"
	else:
		return "way too much"
