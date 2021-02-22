platform = {}
player = {}
 
function love.load()
        -- This is the height and the width of the platform.
	platform.width = love.graphics.getWidth()    -- This makes the platform as wide as the whole game window.
	platform.height = love.graphics.getHeight()  -- This makes the platform as tall as the whole game window.
 
        -- This is the coordinates where the platform will be rendered.
	platform.x = 0                               -- This starts drawing the platform at the left edge of the game window.
	platform.y = 500      
    
    player.x = love.graphics.getWidth() / 2   -- This sets the player at the middle of the screen based on the width of the game window. 
	player.y = 500 -- This starts drawing the platform at the very middle of the game window
    player.img = love.graphics.newImage('purple.png')

    player.speed = 250
    player.ground = player.y     -- This makes the character land on the plaform.
 
	player.y_velocity = 0        -- Whenever the character hasn't jumped yet, the Y-Axis velocity is always at 0.
 
	player.jump_height = -300    -- Whenever the character jumps, he can reach this height.
	player.gravity = -500   
end

function love.update(dt)

    if love.keyboard.isDown('d') then                    -- When the player presses and holds down the "D" button:
		player.x = player.x + (player.speed * dt) 
           -- The player moves to the right.
	elseif love.keyboard.isDown('a') then                -- When the player presses and holds down the "A" button:
		player.x = player.x - (player.speed * dt)    -- The player moves to the left.
        

	end
if love.keyboard.isDown('d') then
		-- This makes sure that the character doesn't go pass the game window's right edge.
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		-- This makes sure that the character doesn't go pass the game window's left edge.
		if player.x > 0 then 
			player.x = player.x - (player.speed * dt)
		end
	end
end
 
function love.draw()
	love.graphics.setColor(1, 1, 1)        -- This sets the platform color to white.
 
        -- The platform will now be drawn as a white rectangle while taking in the variables we declared above.
	love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
    love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end