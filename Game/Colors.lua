function normalizeColor(colorTable)
    return {
        colorTable[1] / 255,
        colorTable[2] / 255,
        colorTable[3] / 255
    }
end

-- table containing colors
Colors = {
    ["ballColor"] = normalizeColor({76, 76, 76}),
    ["brickColor"] = {
        normalizeColor({195, 174, 214}),
        normalizeColor({134, 117, 169})
    },
    ["paddleColor"] = normalizeColor({238, 111, 87}),
    ["infoBarColor"] = normalizeColor({239, 187, 207}),
    ["backgroundColor"] = normalizeColor({255, 213, 205})
}


