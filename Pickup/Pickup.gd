extends Node2D

func _ready():
	self.connect("body_entered", self, "on_Pickup_body_entered")
	
func _process(delta):
	#  rotate pickup by 45 degrees
	self.rotate(PI/4 * delta)

func on_Pickup_body_entered(body):
	if body.name == "Player":
		body.update_score()
		$".".queue_free()

