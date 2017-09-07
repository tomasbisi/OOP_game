 
class Army
    attr_accessor :army_name, :gold, :num_miners, :num_archers, :num_knights, :power

    def initialize(army_name, gold, num_miners, num_archers, num_knights)
        @army_name = army_name
        @gold = gold
        @num_miners = num_miners
        @num_archers = num_archers
        @num_knights = num_knights 
        @power = num_miners * 5 + num_archers * 10 + num_knights * 20
        @archers = []
        @miners = []
        @knights = []
    end

    def put_stats        
        puts "Army: #{@army_name}"
        puts "Gold: #{@gold}"
        puts "Miners: #{@num_miners}"
        puts "Archers: #{@num_archers}"
        puts "Knights: #{@num_knights}"
        puts "Power of the army = #{power}\n\n"        
    end 
end


class Battle
    attr_accessor :army1, :army2

    def initialize (army1, army2)
        @army1 = army1
        @army2 = army2
    end

    def fight 
        if @army1.power > @army2.power
            @army1.gold = (@army1.gold + 100)
            @army2.num_knights = 0
            @army2.num_archers = 0
            @army2.power = @army2.num_miners * 5 + @army2.num_archers * 10 + @army2.num_knights * 20
            puts "You won the Battle!!!\n\n"
            $battles_won = $battles_won + 1
        else
            
            @army2.gold = (@army2.gold + 100)
            @army1.num_knights = 0
            @army1.num_archers = 0
            @army1.power = @army1.num_miners * 5 + @army1.num_archers * 10 + @army1.num_knights * 20
            puts "You lost the battle!!!\n\n"
            $battles_loose = $battles_loose + 1
        end
        if @army1.power == @army2.power
            @army1.num_knights = (@army1.num_knights - 2)
            @army2.num_knights = (@army2.num_knights - 2)
            puts "Both Teams tied the battle!!!\n\n"
            $battles_tie = $battles_tie + 1
        end
    end
end

class Miner
    attr_accessor :army_name

    def initialize (army_name)  
        @army_name = army_name     
    end

    def train
        @army_name.power = @army_name.power + 3  
        @army_name.gold = @army_name.gold - 10
        puts "A miner has been trained!\n\n"
    end

    def transformation
        @army_name.gold = @army_name.gold - 30
        @army_name.num_archers = @army_name.num_archers + 1
        @army_name.num_miners = @army_name.num_miners - 1
        @army_name.power = @army_name.num_miners * 5 + army_name.num_archers * 10 + army_name.num_knights * 20
        puts "Miner has been transformed into Archer.\n\n"
    end
end


class Archer
    attr_accessor :army_name

    def initialize (army_name)  
        @army_name = army_name     
    end

    def train
        @army_name.power = @army_name.power + 7 
        @army_name.gold = @army_name.gold - 20
        puts "An Archer has been trained.\n\n"
        
    end

     def transformation
        @army_name.gold = @army_name.gold - 40
        @army_name.num_knights = @army_name.num_knights + 1
        @army_name.num_archers = @army_name.num_archers - 1
        @army_name.power = @army_name.num_miners * 5 + army_name.num_archers * 10 + army_name.num_knights * 20
        puts "Archer has been transformed into Knight.\n\n"
    end
end


class Knight
    attr_accessor :army_name

    def initialize (army_name)  
        @army_name = army_name     
    end

    def train
        puts "Training Stats\n"
        @army_name.power = @army_name.power + 10  
        @army_name.gold = @army_name.gold - 30
        puts "A Knight has been trained.\n\n"
    end
end