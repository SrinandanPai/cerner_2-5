-- cerner_2tothe5th_2021

function love.load()
    source = love.audio.newSource("Drum Roll Cymbal Crash.mp3", "static")
    x1, y1, w1, h1, x2, y2, w2, h2 = 0, 0, 500, 1000, 500, 0, 1000, 1000
    content = {'Cerner ', '2^5 2021\n', '19 ', 'Days ', 'Left\n', 'Engineering ', 'Collaboration'}
    stream = ' '
    i = 1
end

function love.update(dt)
    w1, x2 = w1 - 7, x2 + 7
    if(i < 8 and w1 < 0) then
        stream = stream..content[i]
        i = i + 1
    end
    if(x2 > 1200) then love.event.quit( ) end
end

function love.draw()
    love.audio.play( source )
    love.graphics.setColor(0, 1, 0)
    love.window.setTitle( 'Cerner 2^5' )
    love.window.setMode( 1000, 1000 )
    love.graphics.setFont( love.graphics.newFont("Pixeboy.ttf", 50) )
    love.graphics.printf( stream, 200, 400, 600, 'center')

    love.graphics.setColor(0.4, 0, 0)
    love.graphics.rectangle("fill", x1, y1, w1, h1)
    love.graphics.rectangle("fill", x2, y2, w2, h2) 
end