extends KinematicBody2D

const GRAVITY = 2000
const MAX_SPEED = 500
const ACCEL = 500
const FRICTION = 2000
const JUMP = 850

onready var anim = $AnimatedSprite

var score = 0
var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('ui_right'):
		if velocity.x < 0:
			velocity.x = 0
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		anim.play('walk')
		anim.flip_h = false
	elif Input.is_action_pressed('ui_left'):
		if velocity.x > 0:
			velocity.x = 0
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL * delta)
		anim.play('walk')
		anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		anim.play('idle')
	if Input.is_action_just_pressed('ui_select') and is_on_floor():
		velocity.y = -JUMP
	if not is_on_floor():
		anim.play('jump')
	
func _physics_process(delta):
	#gravity
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Coin_body_entered(body):
	score += 1
	$Camera2D/Label.text = "Score: " + str(score)

