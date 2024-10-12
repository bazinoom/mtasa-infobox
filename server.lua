


function addBox(sourceElement, type, msg)
    if sourceElement.type ~= "player" then
        if isElement(sourceElement:getData("inventory.open2")) or isElement(sourceElement:getData("inventory.open")) then
            sourceElement = sourceElement:getData("inventory.open2") or sourceElement:getData("inventory.open")
        end
    end
    
    triggerClientEvent(sourceElement, "addBox", sourceElement, type, msg)
end
addEvent("addBox", true)
addEventHandler("addBox", root, addBox)

addCommandHandler("b", function(source)
	exports["play_infobox"]:addBox(source, "info", "Acidentalmente")
end)