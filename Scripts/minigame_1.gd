extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer
# ^^^ You dragged this in the scene by the way 

var garlic_collected = 0 # just keeping track of garlic collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func _ready() -> void:
	await themed_timer.Timer(20.0)
	#after this is completed...
	timer_end = true 

func _process(_delta: float) -> void: # running every frame brochacho
	
	if garlic_collected == 3: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		if Global.minigames_done > 3: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://Scenes/done_scene.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # go back to the intermission scene
	
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 # go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission
		

func _on_garlic_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return


func _on_garlic_2_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return


func _on_garlic_3_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
	return
