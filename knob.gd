extends Sprite2D

var pressing:bool = false

func _on_button_button_down():
	pressing = true


func _on_button_button_up():
	pressing = false
