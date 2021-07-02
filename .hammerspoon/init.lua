stackline = require "stackline"

local stacklineConfig = {
   appearance = {
      color = { white = 0.90 },
      alpha = 1,
      dimmer = 2.5,
      iconDimmer = 1.1,
      showIcons = false,
      size = 32,
      radius = 3,
      iconPadding = 4,
      pillThinness = 6,
      vertSpacing = 1.2,
      offset = {
         y = 2,
         x = 2
      },
      shouldFade = true,
      fadeDuration = 0.2
   }
}

stackline:init(stacklineConfig)
