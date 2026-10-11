-- {{< score NAME "Accessible description" [inline] >}}
-- SVG and LilyPond files live together in assets/scores/.
return {
  score = function(args, kwargs, meta)
    local name = pandoc.utils.stringify(args[1])
    local alt = pandoc.utils.stringify(args[2] or args[1])
    local mode = args[3] and pandoc.utils.stringify(args[3]) or "display"
    if not name:match("^[%w_-]+$") then error("Score name must be a simple filename stem") end
    local class = mode == "inline" and "score-inline" or "score-display"
    local attr = pandoc.Attr("", {class}, {loading="lazy"})
    return pandoc.Image({pandoc.Str(alt)}, "/assets/scores/" .. name .. ".svg", "", attr)
  end
}
