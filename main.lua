

function love.load()

    ybirdGravity = 0
    ybird = 180
    birdX = 62
    birdWidth = 30

    worldWidth = 800
    worldHeight = love.graphics.getHeight()
    gameOver = false
   
    pipeSpaceHeight = 75
    pipeSpaceY = love.math.random(0, worldHeight - pipeSpaceHeight)
    pipeX = worldWidth
    widthPipe = 250
   
    playerScore = 0
    highScore = 0
    highScore = loadHighScore()

    pipeReset()

end

function pipeReset()

    local pipeSpaceYMin = 30
    
    pipeSpaceY = love.math.random(pipeSpaceYMin, worldHeight - pipeSpaceHeight - pipeSpaceYMin)
    pipeX = worldWidth
    widthPipe = 20
    
    playerScore = playerScore + 1

end

function love.update(dt)

    ybirdGravity = ybirdGravity + (500 * dt)
    ybird = ybird + (ybirdGravity * dt)
    pipeX = pipeX - (400  * dt)

    if (pipeX + widthPipe) < -widthPipe then pipeReset() 
    end

    if birdX < (pipeX + widthPipe) and (birdX + birdWidth) > pipeX and (ybird < pipeSpaceY) then 
        gameOver = true
    end

    if birdX < (pipeX + widthPipe) and (birdX + birdWidth) > pipeX and (ybird > pipeSpaceY + pipeSpaceHeight) then 
        gameOver = true
    end

    if (ybird > worldHeight) then  
        gameOver = true 
    end

    if gameOver == true then 
                
    if (tonumber(highScore) < playerScore) then
         highScore = playerScore
         saveHighScore(highScore)
    end

      love.event.quit("restart") 

    end
end

function love.keypressed(key) 
    
  if key == ("space") then 
     ybirdGravity = -200 
  end 

end

function love.draw()

    love.graphics.setColor(1, 0, 2, 0, 9)
    love.graphics.rectangle("fill", 0, 0, worldWidth, worldHeight)

    love.graphics.setColor(.70, .90, .30)
    love.graphics.rectangle('fill', birdX, ybird, 15, 20)

    local pipeWidth = 25

    love.graphics.setColor(.37, .82, .28)

    love.graphics.rectangle('fill', pipeX, 0, pipeWidth, pipeSpaceY)

    love.graphics.rectangle('fill', pipeX, pipeSpaceY + pipeSpaceHeight, pipeWidth, worldHeight - pipeSpaceY - pipeSpaceHeight)

    local font = love.graphics.newFont(18)
    love.graphics.setFont(font)

	love.graphics.print({"SCORE: " .. playerScore}, 10, 10)

	love.graphics.print({"HIGH SCORE: " .. highScore}, love.graphics.getWidth() - font:getWidth("HIGH SCORE: 999"), 10)

end


function loadHighScore() 

    local highscore = love.filesystem.read("highscore.sav")

    if(highscore == nil) then
        highscore = 0
    end

    return highscore

end


function saveHighScore(newHighScore)

    love.filesystem.write("highscore.sav", newHighScore)

end

