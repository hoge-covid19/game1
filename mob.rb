# coding: utf-8

class Mob < Sprite
#    @@instances = []
#    def initialize
#       @@instances << self
#   end
    # Flag for sprite moving or not
#    @move_or_not = [true,false].sample
#    class << self
#        attr_accessor :move_or_not
#    end
#   def move_or_not
#        Mob.move_or_not
#    end
#    def move_or_not=(value)
#        Mob.move_or_not=value
#    end
    
    def update
        movement = ['up','down','left','right','stop'].sample
        case movement
        when 'up'
            self.y -= 2
        when 'down'
            self.y += 2
        when 'left'
            self.x -= 2
        when 'right'
            self.x += 2
            
        end
    end
    
end
