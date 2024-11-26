extends StaticBody2D

var rng = RandomNumberGenerator.new()
var is_in = 0
var pos=[
	[1,0],
	[2,0],
	[3,0],
	[4,0],
	[5,0]
	]
var numbers = [1,2,3,4,5]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("RandPosItems")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func randnum():
	var random_index = rng.randi_range(0, numbers.size() - 1)
	var random_number = numbers[random_index]
