extends CharacterBody2D

var speed = 200.0

func _ready():
	velocity = Vector2(speed, speed)

func _physics_process(delta):

	var collision = move_and_collide(velocity * delta)
	if not collision: return
	velocity = velocity.bounce(collision.get_normal())

