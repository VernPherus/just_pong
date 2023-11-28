extends Node2D

func _ready():
	pass 

func _process(delta):
	pass

func _on_out_bounds_body_entered(body):
	body.queue_free()
