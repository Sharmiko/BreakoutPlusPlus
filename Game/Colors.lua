function normalizeColor(colorTable)
    return {
        colorTable[1] / 255,
        colorTable[2] / 255,
        colorTable[3] / 255
    }
end

-- table containing colors
Colors = {
    ["ballColor"] = normalizeColor({76,85,117}),
    ["brickColor"] = {
        normalizeColor({116, 196, 147}),
        normalizeColor({97, 116, 97})
    },
    ["paddleColor"] = normalizeColor({66,119,122}),
    ["infoBarColor"] = normalizeColor({86, 152, 196}),
    ["backgroundColor"] = normalizeColor({86, 152, 196}),
    ["gameOverTextColor"] = normalizeColor({201, 74, 83}),
    ["winTextColor"] = normalizeColor({116, 196, 147}),
    ["choiceBoxColor"] = {
        ["lose"] = {},
        ["win"] = {}
    },
    ["buttonTextColor"] = normalizeColor({81, 87, 74})
}


