

function love.load(dt)
    playerX = 20
    playerY = 525
    square = {}
    base = {}
    baseY = 550
    baseX = 0
        world = love.physics.newWorld(0, 9.81*640, true)
        world = love.physics.newWorld(0, 9.81*64, true )
        square.body = love.physics.newBody(world, playerX, playerY, "dynamic")
        square.shape = love.physics.newRectangleShape(25, 25)
        square.fixture = love.physics.newFixture(square.body, square.shape, 1)
        base.shape = love.physics.newRectangleShape(50, 50)
        base.body = love.physics.newBody(world, baseY, baseX, "static")
        base.fixture = love.physics.newFixture(base.body, base.shape, 1)
    
    end
    
    function love.update(dt)
        world:update(dt)
        if love.keyboard.isDown("a") then
            playerX = playerX - 200 * dt
        end
            if love.keyboard.isDown("d") then
                playerX = playerX + 200 * dt
            
            end
            if love.keyboard.isDown("space") then
                playerY = playerY - 100 * dt
            
            end
        end
    
    
        
    function love.draw()
        love.graphics.setColor(1, 0.5, 0)
        love.graphics.rectangle("fill",playerX,playerY,25,25)	 --player
        love.graphics.setColor(0, 0,9, 1)
        love.graphics.rectangle("fill", baseX, baseY, 1000, 500) --base
    
        
        background = love.graphics.setBackgroundColor(0, 0, .118) --background
    end
    
    