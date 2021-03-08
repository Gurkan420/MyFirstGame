platform = {}
player = {}
 
function love.load()



        
	platform.width = love.graphics.getWidth()    --bredd
	platform.height = love.graphics.getHeight()  --höjd
 
        
	platform.x = 0                             
	platform.y = 500      
    
    player.x = love.graphics.getWidth() / 2 --spelare i mitten
	player.y = 500 
    player.img = love.graphics.newImage('purple.png')

    player.speed = 250
    player.ground = player.y     -- landar på platformen
 
	player.y_velocity = 0        -- när spelaren inte hoppat           tror jag missat något, går ej att hoppa?
 
	player.jump_height = -300    -- hur högt spelaren kan hoppa
	player.gravity = -500   
end

function love.update(dt)

    if love.keyboard.isDown('d') then                   
		player.x = player.x + (player.speed * dt) 
           
	elseif love.keyboard.isDown('a') then               
		player.x = player.x - (player.speed * dt)    
        

	end

    function love.keypressed( key )
        player.jumpVel = -10
        if key == ('w') and playerCanJump then
          player.yvel = player.jumpVel
          playerCanJump = false
        end
      end
if love.keyboard.isDown('d') then
		--funkade inte att skapa en border vid sidorna
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	elseif love.keyboard.isDown('a') then
		--andra sidan
		if player.x > 0 then 
			player.x = player.x - (player.speed * dt)
		end
	end
end
 
function love.draw()
	love.graphics.setColor(1, 1, 1)       --vit platform
 
   
	love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)
    love.graphics.draw(player.img, player.x, player.y, 0, 1, 1, 0, 32)
end