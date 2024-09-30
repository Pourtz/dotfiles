-- TODO: research a way to do this with only lua
local function inMathMode()
  return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 1
end

local function returnIfNotEmpty(args, _, user_arg)
  if (args[1][1] ~= "") then
    return user_arg
  else
    return ""
  end
end

return {
  -- Quotation marks
  s({trig="qt", snippetType="snippet", desc="Quotation marks"},
    fmta([[``<>'' ]], {i(1),})),

  -- Inline math
  s({trig="mm", snippetType="autosnippet", desc="Inline math"},
    fmta([[\(<>\) ]], {i(1),})),

  -- Display math
  s({trig="MM", snippetType="autosnippet", desc="Display math"},
    fmta( [[
          \[
            <>
          \]

          ]],
          {i(1),})),

  -- Environment
  s({trig="env", snippetType="snippet", desc="Begin and end an arbitrary environment"},
    fmta(
        [[
        \begin{<>}
            <>
        \end{<>}

        ]],
        {i(1), i(2), rep(1),})),

  -- Integral
  s({trig="int", snippetType="autosnippet", desc="Integral with various options", wordTrig=false, condition=inMathMode},
      fmta([[\int<><><> <> \,d<> ]], {
        f(returnIfNotEmpty, {1}, {user_args = {"_{"}}),
        i(1),
        d(2,
          function(args)
            if (args[1][1] ~= "") then
              return sn(nil,{
                t("}"),
                f(returnIfNotEmpty, {1}, {user_args = {"^{"}}),
                r(1, "provisional-key", i(1)),
                f(returnIfNotEmpty, {1}, {user_args = {"}"}}),
              })
            else
              return sn(nil,t(""))
            end
          end,
          {1}),
        i(3), i(4)
      })),

  -- Fraction
  s({trig="fr", snippetType="autosnippet", desc="Fraction", wordTrig=false, condition=inMathMode},
    {
      c(1, {
        sn(nil, fmta([[\frac{<>}{<>} ]], {r(1, "f1"), r(2, "f2")})),
        sn(nil, fmta([[\dfrac{<>}{<>} ]], {r(1, "f1"), r(2, "f2")})),
        sn(nil, fmta([[\tfrac{<>}{<>} ]], {r(1, "f1"), r(2, "f2")})),
      }),
    }, {
      stored = {
        ["f1"] = i(1),
        ["f2"] = i(2)
      }
    }),

  -- Left-Right pair
  s({trig="lr", snippetType="autosnippet", desc="Pair of left-right", wordTrig=true, condition=inMathMode},
    fmta([[\left<> <> \right<> ]], {i(1), i(3), i(2),})),

  -- Parenthesis
  s({trig="prent", snippetType="autosnippet", desc="Parenthesis", wordTrig=true, condition=inMathMode},
    fmta([[\prent{<>} ]], {i(1),})),
}
