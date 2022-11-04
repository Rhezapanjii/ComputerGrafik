extends CollisionShape2D

const terbang = 150
const up = Vector2(0,-1)
const jatuh =150
const gravity =10

var motion  = vector2()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):

	motion.y += gravity
	if motion.y > jatuh:
		motion.y = jatuh
		
	if input.is_action_just_pressed("FLAP")
	motion.y = FLAP
	
	motion = move_and_slide(motion, up)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
