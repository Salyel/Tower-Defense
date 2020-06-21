extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_Exit_pressed():
	get_tree().quit()

func _on_Resume_pressed():
	self.owner.on_resume()
