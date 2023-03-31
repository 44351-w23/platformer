extends Area2D

func _ready():
	$AnimatedSprite.play()

func _on_Coin_body_entered(body):
	queue_free()
