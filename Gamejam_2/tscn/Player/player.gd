extends CharacterBody2D
@onready var lang_tiao_timer: Timer = $LangTiaoTimer


var aaaaa = 35    #左右移动中的加速度

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

#左右移动
func move():
	var direction = Input.get_axis("left", "right") 
	if velocity.x >180 or velocity.x <-180:
		velocity.x = move_toward(velocity.x, 0, aaaaa)
	elif direction == 1:
		velocity.x += aaaaa
	elif direction == -1:
		velocity.x -= aaaaa
	elif direction == 0:
		velocity.x = move_toward(velocity.x, 0, aaaaa)

#土狼时间
func langtiao():
	var was_on_floor = is_on_floor()
	var just_left_ledge = was_on_floor and not is_on_floor() and velocity.y >= 0
	if just_left_ledge:
		lang_tiao_timer.start()
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor() or lang_tiao_timer.time_left > 0.0:
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move()
	langtiao()
	move_and_slide()
