extends StaticBody2D

var gamemanager
var rng = RandomNumberGenerator.new()
var is_in = 0
var random_number
var player
var tempnum = 0

var numbers = [1,2,3,4,5]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("RandPosItems")
	gamemanager=get_node("/root/Main/Gamemanager")
	player=get_node("/root/Main/Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test"):
		#print(gamemanager.pos[0][1],gamemanager.pos[1][1],gamemanager.pos[2][1],gamemanager.pos[3][1],gamemanager.pos[4][1])
		print(self.position,"||",is_in)
func randnum():
	#if random_number != null:
		#tempnum = random_number
	var random_index = rng.randi_range(0, numbers.size() - 1)
	random_number = numbers[random_index]
func randpos():
	#for i in range(100):
		#if gamemanager.pos[random_number-1][1] != 0:
			#randnum()
			#print("!",i, gamemanager.pos[random_number-1][1] )
		#else:
			#break
	#if gamemanager.pos[random_number-1][1] == 0:
	if is_in == 0:
		for i in range(100):
			if abs(gamemanager.pos[random_number-1][0].x - player.position.x) <= 120 or gamemanager.pos[random_number-1][1] != 0:
				randnum()
			else:
				break
		#gamemanager.pos[random_number-1][1] = 1
		#gamemanager.pos[tempnum-1][1] = 0
		self.position = gamemanager.pos[random_number-1][0]
		#print("!",gamemanager.pos[random_number-1][1])
		await get_tree().create_timer(0.01).timeout
		while is_in == 1:
			for i in range(100):
				await get_tree().create_timer(0.01).timeout
				if abs(gamemanager.pos[random_number-1][0].x - player.position.x) <= 120 or gamemanager.pos[random_number-1][1] != 0:
					randnum()
				else:
					break
			#gamemanager.pos[random_number-1][1] = 1
			#gamemanager.pos[tempnum-1][1] = 0
			self.position = gamemanager.pos[random_number-1][0]
	

func leave():
	gamemanager.pos[random_number-1][1] = 0
