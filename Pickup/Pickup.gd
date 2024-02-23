extends Area2D

func _ready():
	self.body_entered.connect(on_Pickup_body_entered)
	
func _process(delta : float):
	#  rotate pickup by 45 degrees
	self.rotate(PI/4 * delta)

func on_Pickup_body_entered(body : RigidBody2D):
	if body.name == "Player":
		body.update_score()
		$".".queue_free()

