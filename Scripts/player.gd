extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var is_died = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if not is_died:
	# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# 获取方向输入 -1,0,1
		var direction := Input.get_axis("move_left", "move_right")
		
		#翻转角色精灵
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
		
		#播放动画
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("Idle")
			else :
				animated_sprite.play("Run")
		else :
			animated_sprite.play("Jump")
			
		#应用移动
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
