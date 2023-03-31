extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()

func _on_Flag_body_entered(body):
	$Label.show()
