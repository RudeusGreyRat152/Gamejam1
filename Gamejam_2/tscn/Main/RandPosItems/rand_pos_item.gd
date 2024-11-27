extends StaticBody2D

var gamemanager
var rng = RandomNumberGenerator.new()
var is_in = 0
var random_number
var player

var numbers = [1,2,3,4,5]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("RandPosItems")
	gamemanager=get_node("/root/Main/Gamemanager")
	player=get_node("/root/Main/Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func randnum():
	var random_index = rng.randi_range(0, numbers.size() - 1)
	random_number = numbers[random_index]

func randpos():
	gamemanager.pos[random_number-1][1] = 0
	for i in range(10):
		if gamemanager.pos[random_number-1][1] != 0:
			randnum()
			print("!",i, gamemanager.pos[random_number-1][1] )
	if gamemanager.pos[random_number-1][1] == 0:
		for i in range(10):
			if abs(gamemanager.pos[random_number-1][0].x - player.position.x) <= 120:
				randnum()
		gamemanager.pos[random_number-1][1] = 1
		self.position = gamemanager.pos[random_number-1][0]

func leave():
	gamemanager.pos[random_number-1][1] = 0
