extends KinematicBody2D


const GRAVITY = 1300
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.animation = 'walk'
	$AnimatedSprite.play()

func _physics_process(delta):
	velocity.y += delta*GRAVITY
	move_and_slide(velocity, Vector2.UP)
