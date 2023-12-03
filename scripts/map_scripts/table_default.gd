extends Node2D

var player_scr = 0
var opponent_scr = 0

@onready var ball = $pong_ball
@onready var plyr_pdl = $player_paddle
@onready var enmy_pdl = $opponent_paddle

@onready var player_scr_lbl = $table_ui/player_score
@onready var enemy_scr_lbl = $table_ui/opponent_score

@onready var cnt_dwn_timer = $countdown_timer
@onready var timer_text = $table_ui/countdown

@onready var pause_menu = $pause_menu
@onready var end_menu = $game_end
@onready var end_msg = $game_end/base_game_end/game_res/winner

func _ready():
	updateTable()

func _process(delta):
	check_scr()
	timer_text.text = str(int(cnt_dwn_timer.time_left + 1))

func _on_out_bounds_right_body_entered(body):
	resetTable()
	player_scr += 1
	updateTable()

func _on_out_bounds_left_body_entered(body):
	resetTable()
	opponent_scr += 1
	updateTable()
	

func _on_countdown_timer_timeout():
	get_tree().call_group("ball_group", "restart_ball")
	timer_text.visible = false


func updateTable():
	timer_text.visible = true
	player_scr_lbl.text = str(player_scr)
	enemy_scr_lbl.text = str(opponent_scr)
	get_tree().call_group("ball_group", "stop_ball")
	cnt_dwn_timer.start()

func resetTable():
	ball.position = Vector2(640, 360)
	plyr_pdl.position.x = 265
	enmy_pdl.position.x = 1280 - 265
	

func check_scr():
	if player_scr == 15:
		get_tree().paused = true
		end_msg.text = "Congratulations. You Won!"
		end_menu.show()
	elif opponent_scr == 15: 
		get_tree().paused = true
		end_msg.text = "You Lose!"
		end_menu.show()

func pause():
	get_tree().paused = true
	pause_menu.show()

func unpause():
	pause_menu.hide()
	get_tree().paused = false

func reset_game():
	unpause()
	get_tree().reload_current_scene()
