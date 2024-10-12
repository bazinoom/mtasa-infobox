colors = {
    --['colorname'] = {r, g, b, hex},
    ['red'] = {210,49,49, "#d23131"},
	['green'] = {124,197,118, "#7cc576"},
    ['blue'] = {61,122,188,"#3d7abc"},
	['yellow'] = {255,168,0, "#ffa800"},
	['blue2'] = {36, 109, 208, "#246dd0"},
	['darkblue'] = {47, 77, 115, "#2c4d73"},
    ["orangeOld"] = {255, 153, 51, "#ff9933"},
    ["orangeNew"] = {244, 137, 66, "#f48942"},
    ['lightyellow'] = {255, 209, 26, "#ffd11a"},
    ['gray'] = {156, 156, 156, "#9c9c9c"},
}

devMode = false
serverColor = 'blue'
serverName = 'NameServer'
hexCode = colors[serverColor][4]
low = hexCode .. '[' .. serverName .. '] #FFFFFF'
local serverSide = false
addEventHandler("onResourceStart", resourceRoot,
    function()
        serverSide = true
    end
)

serverData = {
    --['dataname'] = unknow,
    ['sponsor'] = 'Nevils',
    ['NameServer'] = true,
    ['developer'] = '', 
	['designer'] = '', 
    ['owner'] = '',
	['version'] = "Beta",
    ['name'] = serverName,
    ['color'] = serverColor,
	['mod'] = 'NameServer',
	['city'] = 'Los Santos',
	['minScreenSize'] = {1024, 768},
	['defaultBlurLevel'] = 0,
	['syntax'] = low,
}

function getVersion()
    return serverData["version"]
end

function converType(t)
    if t == "error" then
        return 'red'
    elseif t == "info" then
        return 'blue'
    elseif t == "warning" then
        return 'yellow'
    elseif t == "success" then
        return 'green'
    end
    
    return nil
end

function getServerSyntax(extra, t)
    if extra and type(extra) == "table" then
        local extra = extra["text"]
        if extra then
            if t then
                if colors[t] then
                    return colors[t][4] .. '[' .. extra .. '] #FFFFFF'
                else
                    return colors[converType(t)][4] .. '[' .. extra .. '] #FFFFFF'
                end
            else
                return hexCode .. '[' .. extra .. '] #FFFFFF'
            end
        end
    elseif extra and type(extra) == "string" then
        if t then
            if colors[t] then
                return colors[t][4] .. '[' .. serverName .. ' - ' .. extra .. '] #FFFFFF'
            else
                return colors[converType(t)][4] .. '[' .. serverName .. ' - ' .. extra .. '] #FFFFFF'
            end
        else
            return hexCode .. '[' .. serverName .. ' - ' .. extra .. '] #FFFFFF'
        end
    else
        if t then
            if colors[t] then
                return colors[t][4] .. '[' .. serverName .. '] #FFFFFF'
            else
                return colors[converType(t)][4] .. '[' .. serverName .. '] #FFFFFF'
            end
        else
            return serverData['syntax']
        end
    end
end


function getServerColor(color, hexCode)
    if color == "orange" then
        color = "blue"
    end
    if not hexCode then
	    local r,g,b = colors[serverColor][1], colors[serverColor][2], colors[serverColor][3]
		if color and colors[color] then
		    r,g,b = colors[color][1], colors[color][2], colors[color][3]
		end
		return r,g,b
	else
	    local hex = colors[serverColor][4]
		if color and colors[color] then
		    hex = colors[color][4]
		end
		return hex
	end
end