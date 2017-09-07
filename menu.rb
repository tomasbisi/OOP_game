load 'test1.rb'
load 'logo.rb'

def exit_option
	exit
end

def clear
	system "clear"
end

def main_menu
	game_start
end

def battle_menu
	puts "Choose Army to fight\n
	[E]nglish / [C]hinese / [B]izantines"
	option_team1 = gets.chomp.downcase
	case option_team1
	when "e"
		option_team1 = @english
	when "c"
		option_team1 = @chinese
	when "b"
		option_team1 = @bizantine
	end
	battle = Battle.new(@option_player, option_team1).fight
	puts "Your Stats:\n" 
	@option_player.put_stats
	puts "Enemy's Stats:\n"
	puts option_team1.put_stats
	
end

def train_menu 
	puts "Choose a Soldier to train\n
	[M]iner / [A]rcher / [K]night -- [p] to Main Menu -- [x] to Exit"
	option_train = gets.chomp.downcase
	case option_train
	when "m"
		train_miner = Miner.new(@option_player).train
		puts @option_player.put_stats
	when "a"
		train_archer = Archer.new(@option_player).train
		puts @option_player.put_stats
	when "k"
		train_knight = Knight.new(@option_player).train
		puts @option_player.put_stats
	when "x"
		exit_option
	when "p"
		
	end
	# main_menu
	
end

def transform_menu
	puts "Choose a Soldier to transform\n
	[M]iner /  [A]rcher -- [p] to Main Menu -- [x] to Exit"
	option_transform = gets.chomp.downcase
	case option_transform
	when "m"
		transform_miner = Miner.new(@option_player).transformation
		puts @option_player.put_stats
	when "a"
		transform_archer = Archer.new(@option_player).transformation
		puts @option_player.put_stats
	when "x"
	exit_option
	when "p"
	
	end	
	
end

def start_stats
	@chinese = Army.new("Chinese", 1000, 2, 25, 2)
    @english = Army.new("English", 1000, 10, 10, 10)
    @bizantine = Army.new("Bizantine", 1000, 5, 8, 15)
    $battles_won = 0
    $battles_loose = 0
    $battles_tie = 0
end

def show_stats
	@chinese.put_stats
    @english.put_stats
    @bizantine.put_stats
end

def history
	puts "You won: #{$battles_won} battles\n"
	puts "You lost: #{$battles_loose} battles\n"
	puts "You tied: #{$battles_tie} battles\n"
end

def  game_start
	clear
	puts "What would you like to do?\n 
	[T]rain army / [B]attle / [A]Transform a Soldier / [S]how Army's Stats / [H]istory of Battles / [x] to Exit"
	option_mode = gets.chomp.downcase
	case option_mode
	when "t"
		clear
		train_menu
	when "b"
		clear
		battle_menu
	when "a"
		clear
		transform_menu
	when "s"
		clear
		show_stats
	when "h"
		clear
		history
	when "x"
		clear
		exit_option
	end	
	puts "Press any key to continue..."
	gets.chomp.downcase
	clear
	main_menu
end

clear
logo
puts "Press [Y] to Start the game (this will create initial stats) or [x] to Exit."
option_start = gets.chomp.downcase
case option_start
when "y"
	start_stats
when "x"
	exit_option
end
clear
puts "Choose a Team to play\n 
[E]nglish / [C]hinese / [B]izantines\n\n\n"
	show_stats
	@option_player = gets.chomp.downcase
	case @option_player
		when "e"
			@option_player = @english
			game_start 
		when "c"
			@option_player = @chinese
			game_start
		when "b"
			@option_player = @bizantine
			game_start
	end
	clear



