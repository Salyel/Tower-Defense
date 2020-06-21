extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		on_pause_pressed()


func on_pause_pressed():
	get_tree().paused = true
	$MapVerte/Chemin/ApparitionMobs.paused = true
	$pause_popup.show()

func on_resume():
	get_tree().paused = false
	$MapVerte/Chemin/ApparitionMobs.paused = false
	$pause_popup.hide()
