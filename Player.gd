extends Area2D

export var speed = 40
var screen_size
var press_count = 0
var target_position
var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if press_count == 0:
		scale.x = 0.7
		scale.y = 0.7
		rotation_degrees = 0
	if press_count > 0:
		if position.y > target_position:
			position.y -= speed * delta
			count = 0
		elif count < 60:
			$AnimatedSprite.play("walk")
			count += 1
		else:
			$AnimatedSprite.stop()
			$AnimatedSprite.frame = 0
			count += 1
	if press_count == 6:
		if position.y > target_position:
			position.y -= speed * delta
			$AnimatedSprite.play("walk")
		else:
			rotation_degrees += 400 * delta
			scale -= 5 * scale * delta


func _on_Button_pressed():
	press_count += 1
	target_position = position.y - 42


func _on_Reset_pressed():
	position.y = 297
	$AnimatedSprite.stop()
	$AnimatedSprite.frame = 0
	press_count = 0
