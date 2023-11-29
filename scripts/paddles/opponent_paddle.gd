extends CharacterBody2D


const SPEED = 300
var ball

func _ready():
	ball = get_parent().find_child("pong_ball")

func _physics_process(delta):
	velocity.y = move_toward(0, get_ball_position() * SPEED, SPEED)
	move_and_slide()

func get_ball_position():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0

