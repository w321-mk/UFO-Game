extends Node2D

export (float) var speed
export (NodePath) var count_text
export (NodePath) var win_text

var rb2d
var count

func _ready():
	# if count_text is null:
	#     count_text = get_root().get_parent().find_node("CountLabel", true, false)

	rb2d = $"."
	count = 0
	get_node(win_text).text = ""
	set_count_text()

func _physics_process(_delta):
	var horizontal_movement = get_axis("Horizontal")
	var vertical_movement = get_axis("Vertical")
	var movement = Vector2(horizontal_movement, vertical_movement)
	# rb2d.add_force(Vector2.ZERO, movement * speed)
	rb2d.linear_velocity += movement * speed

func set_count_text():
	if count >= 12:
		get_node(win_text).text = "You Win"

	get_node(count_text).text = "Count: " + str(count)

func update_score():
	count += 1
	set_count_text()

# implemented for the sake of understanding how unity manages its axis input system
func get_axis(axis):
	var direction = 0
	match axis:
		"Horizontal":
			if Input.is_action_pressed("ui_left"):
				direction = -1
			elif Input.is_action_pressed("ui_right"):
				direction = 1
			# else:
			#     direction = 0
		"Vertical":
			if Input.is_action_pressed("ui_up"):
				direction = -1
			elif Input.is_action_pressed("ui_down"):
				direction = 1
			# else:
			#     direction = 0
	return direction
