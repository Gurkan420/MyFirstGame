function love.update(dt)
    -- etc.

    function isBirdCollidingWithPipe(pipeX, pipeSpaceY)
        return
        -- Left edge of bird is to the left of the right edge of pipe
        birdX < (pipeX + pipeWidth)
        and
         -- Right edge of bird is to the right of the left edge of pipe
        (birdX + birdWidth) > pipeX
        and (
            -- Top edge of bird is above the bottom edge of first pipe segment
            birdY < pipeSpaceY
            or
            -- Bottom edge of bird is below the top edge of second pipe segment
            (birdY + birdHeight) > (pipeSpaceY + pipeSpaceHeight)
        )
    end

    if isBirdCollidingWithPipe(pipe1X, pipe1SpaceY)
    or isBirdCollidingWithPipe(pipe2X, pipe2SpaceY) then
        love.load()
    end
end