extends CharacterBody2D

const SPEED = 1000.0

func _physics_process(delta):

	if velocity.x != 0: velocity.x = 0
	
	var direction = Input.get_axis("move_up", "move_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
