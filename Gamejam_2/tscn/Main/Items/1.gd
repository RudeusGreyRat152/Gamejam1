extends StaticBody2D
@onready var light_area: Area2D = $LightArea
@onready var light_static_body_2d: StaticBody2D = $"../../Player/Light/LightStaticBody2D"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer_2: Timer = $Timer2
@onready var sprite: Node2D = $Sprite


var aaa = 0
var rng = RandomNumberGenerator.new()
var sametest = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("suiji")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer.time_left > 0:
		self.visible = false
	else:
		self.visible = true



#func _on_light_area_body_exited(body: Node2D) -> void:
	#if body.is_in_group("light"):
		#self.position.x += (rng.randf()-0.5) * 30
		#print("111")


func _on_light_area_body_shape_exited(body_rid: RID, body: Node2D , body_shape_index: int, local_shape_index: int) -> void:
	#self.collision_layer = 0
	#self.collision_mask = 0
	#collision_shape_2d.process_mode = Node.PROCESS_MODE_DISABLED
	#self.position.x += (rng.randf()-0.5) * 100
	#while abs(self.global_position.x - light_static_body_2d.global_position.x) <= 300:
		#self.position.x += (rng.randf()-0.5) * 100
		#print("1")
	#self.visible = true
	#self.collision_layer = 1
	#self.collision_mask = 1
	if abs(self.global_position.x - light_static_body_2d.global_position.x) >= 120.0 and aaa==0:
		timer.start()
		self.position.x = (rng.randf()-0.5) * 1000
		while abs(self.global_position.x - light_static_body_2d.global_position.x) <= 150.0 :
			self.position.x = (rng.randf()-0.5) * 1000
			timer.start()
			await get_tree().create_timer(0.2).timeout
		aaa = 1
		await get_tree().create_timer(0.1).timeout
		aaa = 0
func _on_coll_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("suiji") and aaa == 2:
		timer.start()
		var dir = (abs(self.global_position.x - light_static_body_2d.global_position.x)/(self.global_position.x - light_static_body_2d.global_position.x))
		self.global_position.x += 50*dir
		#while abs(self.global_position.x - body.global_position.x) <= 50:
			#self.position.x = (rng.randf()-0.5) * 1000
			#await get_tree().create_timer(0.2).timeout
			#timer.start()
			#timer_2.start()
	sametest = 1
		
	
