class Planets
	A = 6.67408e-11
	
	attr_accessor :x, :y, :scaledY, :scaledX, :velocityX, :velocityY,:mass,:total_force, :name, :acceleration, :forceX, :forceY, :accelerationX, :accelerationY, :full_force, :doublexdistance, :doubleydistance
	
	def initialize(x,y,velocityX,velocityY,mass,img,radius)
		@img = Gosu::Image.new("images/#{img}")
		@x = x
		@y = y
		@name = img
		@velocityX = velocityX
		@velocityY = velocityY
		@mass = mass
		@radius = radius
		@scaledX = @scaledY = @total_force = @full_force = @doublexdistance = @doubleydistance = @forceX= @forceY = @accelerationX = @accelerationY = 0.0
	end
	
	def draw
		@img.draw(@xscaled - @img.width / 2.0, @yscaled - @img.height / 2.0 ,1)
	end

	 def total_force(planet)
		xdistance = @x- planet.x
	 	ydistance = @y - planet.y
	 
	 	doublexdistance = xdistance**2
	 	doubleydistance = ydistance**2
	 	distance = Math.sqrt(doublexdistance + doubleydistance)
	 	
	 	@full_force = A*@mass*planet.mass
	 	@total_force = @full_force/(distance**2)
	 
	 	@forceX -= (@total_force * xdistance) / distance
		@forceY -= (@total_force * ydistance) /distance
		
	end

	def speed
	 	 @accelerationX =  (@forceX / @mass)
	 	 @accelerationY = (@forceY / @mass)
	 	 @forceX = 0
	 	 @forceY = 0
	 end

	 def velocity
	 	 @velocityX = (@velocityX + 15000 * @accelerationX)
		 @velocityY = (@velocityY + 15000 * @accelerationY)
	 end

	def position
	 	 @x +=  @velocityX * 15000
	 	 @y += @velocityY * 15000
	 	@xscaled =(@x /(@radius*2)) +512
		@yscaled =(-@y/(@radius*2)) +512
	end


end