extends Node2D

var garlic_collected = 0 # just keeping track of garlic collected

func _process(_delta: float) -> void: # running every frame brochacho
	
	if garlic_collected == 10: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		if Global.minigames_done > 3: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://Scenes/done_scene.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # go back to the intermission scene

#why are you looking at this code

# theres nothing here

# DEFINITELY NOTHING

# STOP

# DONT LOOK AT THE CODE BELOW

# ITS GOT A DIFF CONNECTOR FOR EVERY GARLIC

# I KNOW ITS BAD

# DONT KILL ME

# FINE YOU GET TO SEE IT

# IT IS OPEN SOURCE AFTER ALL

# fine look.

# i dont care anymore.

func _on_garlic_garlic_missed() -> void:
	Global.minigames_done -=1
	Global.lives -= 1
	get_tree().change_scene_to_file("res://Scenes/level_scene.tscn") # back to intermission


func _on_garlic_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_7_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_8_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_2_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_3_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_4_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_5_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_9_garlic_collected() -> void:
	garlic_collected = garlic_collected +1


func _on_garlic_10_garlic_collected() -> void:
	garlic_collected = garlic_collected +1

func _on_garlic_6_garlic_collected() -> void:
	garlic_collected = garlic_collected +1
