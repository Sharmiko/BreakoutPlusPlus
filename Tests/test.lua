function love.load()
	circle_radius = math.random(10, 150)
	circle_x = math.random(circle_radius, love.graphics.getWidth() - circle_radius)
	circle_y = math.random(circle_radius, love.graphics.getHeight() - circle_radius)


	rectangle_width = math.random(10, 300)
	rectangle_height = math.random(10, 300)
	rectangle_x = math.random(0, love.graphics.getWidth() - rectangle_width)
	rectangle_y = math.random(0, love.graphics.getHeight() - rectangle_height)
end

function love.draw()
	if circle_and_rectangle_overlap(circle_x, circle_y, circle_radius, rectangle_x, rectangle_y, rectangle_width, rectangle_height) then
		love.graphics.setColor(0, 255, 0)
	else
		love.graphics.setColor(255, 255, 255)
	end

	if point_in_circle(love.mouse.getX(), love.mouse.getY(), circle_x, circle_y, circle_radius) then
		circle_style = 'fill'
	else
		circle_style = 'line'
	end

	if point_in_rectangle(love.mouse.getX(), love.mouse.getY(), rectangle_x, rectangle_y, rectangle_width, rectangle_height) then
		rectangle_style = 'fill'
	else
		rectangle_style = 'line'
	end

	love.graphics.circle(circle_style, circle_x, circle_y, circle_radius)
	love.graphics.rectangle(rectangle_style, rectangle_x, rectangle_y, rectangle_width, rectangle_height)
end

function love.update(dt)
	if rectangle_selected then
		rectangle_x = love.mouse.getX() + rectangle_offset_x
		rectangle_y = love.mouse.getY() + rectangle_offset_y
	end

	if circle_selected then
		circle_x = love.mouse.getX() + circle_offset_x
		circle_y = love.mouse.getY() + circle_offset_y
	end
end

function love.mousepressed(mouse_x, mouse_y)
	if point_in_rectangle(mouse_x, mouse_y, rectangle_x, rectangle_y, rectangle_width, rectangle_height) then
		rectangle_selected = true
		rectangle_offset_x = rectangle_x - mouse_x
		rectangle_offset_y = rectangle_y - mouse_y
	end

	if point_in_circle(mouse_x, mouse_y, circle_x, circle_y, circle_radius) then
		circle_selected = true
		circle_offset_x = circle_x - mouse_x
		circle_offset_y = circle_y - mouse_y
	end
end

function love.mousereleased()
	rectangle_selected = false
	circle_selected = false
end

function love.keypressed()
	love.load()
end

function circle_and_rectangle_overlap(cx, cy, cr, rx, ry, rw, rh)
	local circle_distance_x = math.abs(cx - rx - rw/2)
	local circle_distance_y = math.abs(cy - ry - rh/2)

	if circle_distance_x > (rw/2 + cr) or circle_distance_y > (rh/2 + cr) then
		return false
	elseif circle_distance_x <= (rw/2) or circle_distance_y <= (rh/2) then
		return true
	end

	return (math.pow(circle_distance_x - rw/2, 2) + math.pow(circle_distance_y - rh/2, 2)) <= math.pow(cr, 2)
end

function point_in_rectangle(point_x, point_y, left, top, width, height)
	return point_x >= left
	and point_x <= left + width
	and point_y >= top
	and point_y <= top + height
end

function point_in_circle(point_x, point_y, circle_x, circle_y, circle_radius)
    return (math.pow(circle_x - point_x, 2) + math.pow(circle_y - point_y, 2)) <= math.pow(circle_radius, 2)
end