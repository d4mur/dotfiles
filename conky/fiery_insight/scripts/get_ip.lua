local display_public_ip = true
local display_local_ip = true

local public_ip = ""

function conky_click_on_ip(evt)  
  --print(evt.x)
  --print(evt.y)
  --print("  ")
  if evt.type == "mouse_enter" and evt.x >= 296 and evt.x <= 393
    then

      if evt.y >= 31 and evt.y <= 42
        then
          display_local_ip = not display_local_ip
      elseif evt.y >= 73 and evt.y <= 84
        then 
          display_public_ip = not display_public_ip
      end
  end
end


local function get_public_ip()
  if public_ip == nil or public_ip == ""
    then 
      public_ip = conky_parse("${execi 3600 curl -s ifconfig.me/ip}")
  end
  return public_ip
end

local function get_local_ip()
  return conky_parse("${addrs eth0}")
end


function conky_get_public_ip()
  if display_public_ip then
    return get_public_ip()
  else
    return "•••.•••.•••.•••"
  end
end

function conky_get_local_ip()
  if display_local_ip then
    return get_local_ip()
  else
    return "•••.•••.•••.•••"
  end
end
