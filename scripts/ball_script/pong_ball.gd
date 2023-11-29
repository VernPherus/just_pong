extends CharacterBody2D

var speed = 250.0

func _ready():
	randomize()
	velocity.x = [-1, 1][randi() % 2]
	velocity.y = [-0.8, 0.8][randi() % 2]

func _physics_process(delta):

	var collision = move_and_collide(velocity * speed * delta)
	if not collision: return
	velocity = velocity.bounce(collision.get_normal())
	
	velocity.x *= 1.1
	velocity.y *= 1.1

