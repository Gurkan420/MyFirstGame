platform = {}
player = {}
player.y = 0
player.x = 0
player.img = love.graphics.newImage("Gubbe.png")
platform.y = 100
platform.x = 0
platform.height = 0
platform.width = 0





function love.load()
	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()
 
	platform.x = 0
	platform.y = 500
 
	player.x = love.graphics.getWidth() / 2
	player.y = love.graphics.getHeight() / 2
 
	player.speed = 200
 
	player.ground = player.y
 
	--player.y.speed = 0
 
	--player.jump.height = -300
	player.gravity = -500
end
 function player.gravity(dt)
	 if player.y > 0 then
		 player.y = player.y - (10 * dt)
	 end
 end

function love.update(dt)
	
		if love.keyboard.isDown("d") then
			player.x = player.x + (player.speed * dt)
	
	
		elseif love.keyboard.isDown("a") then
			player.x = player.x - (player.speed * dt)
		--if love.keyboard.isDown("space") then

		
	--	if player.y.speed == 0 then
		--		player.y.speed = player.jump.height
		--	end
		--	if player.y.speed ~= 0 then
		--		player.y = player.y + player.y_velocity * dt
			--	player.y_velocity = player.y_velocity - player.gravity * dt 
			
		--	end
	--	end
		end
end
--function love.keypressed(key)
--	if key = "space" then

--	end
--end
function love.draw()
	love.graphics.draw(player.img, player.x,player.y,0,2,2,0,32) -- player

	love.graphics.setColor(1, 1, 1) --background
	love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height) --background
end

