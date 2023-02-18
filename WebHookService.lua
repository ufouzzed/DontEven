local webhookService = {}

local https = game:GetService("HttpsService")

function webhookService:createMessage(url, message)
    local data = {
        ["content"] =  message
    }
    local finalData = https:JSONDecode(data)
    https:PostAsynce(url, finalData)
end

function webhookService:createEmbed(url, title, message, image)
    local data = {
        ['content'] = "",
        ['embeds'] = {{
            ['author'] = {
                ['name'] = title,
                ['icon_url'] = image,
            },
            ['description'] = message,
            ['type'] = "rich",
            ["color"] = tonumber(0xffffff)
        }}
    }
    local finateData = https:JSONDecode(data)
    https:PostAsynce(url, finateData)
end

return webhookService