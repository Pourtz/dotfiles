-- Auxiliary functions
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

-- Snippets
return {
-- Math snippets
  -- Subscript
  s({trig="_", snippetType="autosnippet", desc="Subscript", wordTrig=false, condition=inMathMode},
    fmta([[_{<>}]], {i(1),})
  ),
  -- Supscript
  s({trig="^", snippetType="autosnippet", desc="Supperscript", wordTrig=false, condition=inMathMode},
    fmta([[^{<>}]], {i(1),})
  ),

  -- Asterisk
  s({trig="*", snippetType="autosnippet", desc="Asterisk", wordTrig=true, condition=inMathMode},
    {t("\\ast")}
  ),

  -- Sum
  s({trig="sum", snippetType="autosnippet", desc="Sum with lower and upper limits", wordTrig=false, condition=inMathMode},
    fmta([[\sum<><><> <> ]],
      {
        f(returnIfNotEmpty, {1}, {user_args = {"_{"}}),
        i(1),
        d(2, function(args)
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
          {1}
        ),
        i(3)
      }
    )
  ),

  -- Integral
  s({trig="int", snippetType="autosnippet", desc="Integral with lower and upper limits", wordTrig=false, condition=inMathMode},
    fmta([[\int<><><> <> \,d<> ]],
      {
        f(returnIfNotEmpty, {1}, {user_args = {"_{"}}),
        i(1),
        d(2, function(args)
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
          {1}
        ),
        i(3), i(4)
      }
    )
  ),

  -- Fraction
  s({trig="fra", snippetType="autosnippet", desc="Fraction", wordTrig=false, condition=inMathMode},
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
    }
  ),

  -- Left-Right pair
  s({trig="lr", snippetType="autosnippet", desc="Pair of left-right", wordTrig=true, condition=inMathMode},
    fmta([[\left<> <> \right<> ]], {i(1), i(3), i(2),})
  ),

  -- Parenthesis
  s({trig="prent", snippetType="autosnippet", desc="Parenthesis", wordTrig=true, condition=inMathMode},
    {
      c(1, {
        sn(nil, fmta([[\prent{<>} ]], {r(1, "r1"),})),
        sn(nil, fmta([[\prentc{<>} ]], {r(1, "r1"),})),
        sn(nil, fmta([[\prentb{<>} ]], {r(1, "r1"),})),
      }),
    }, {
      stored = {
        ["r1"] = i(1),
      }
    }
  ),

  s({trig="set", snippetType="autosnippet", desc="Set command", wordTrig=true, condition=inMathMode},
    fmta([[\set{<>}]], {i(1)})
  ),

  -- Mathbb
  s({trig="bb", snippetType="autosnippet", desc="Math blackboard bold", wordTrig=true, condition=inMathMode},
    fmta([[\mathbb{<>}]], {i(1),})
  ),

  -- lim, liminf, limsup (lim)
  s({trig="lim", snippetType="autosnippet", desc="Limits", wordTrig=true, condition=inMathMode},
    {
      c(1, {
        sn(nil, fmta([[\lim_{<>} ]], {r(1, "r1"),})),
        sn(nil, fmta([[\liminf_{<>} ]], {r(1, "r1"),})),
        sn(nil, fmta([[\limsup_{<>} ]], {r(1, "r1"),})),
      }),
    }, {
      stored = {
        ["r1"] = i(1),
      }
    }
  ),

  -- xrightarrow, xrightharpoonup (xr)
  s({trig="xr", snippetType="autosnippet", desc="Arrows with something over", wordTrig=true, condition=inMathMode},
    {
      c(1, {
        sn(nil, fmta([[\xrightarrow{<>} ]], {r(1, "r1"),})),
        sn(nil, fmta([[\xrightharpoonup{<>} ]], {r(1, "r1"),})),
      }),
    }, {
      stored = {
        ["r1"] = i(1),
      }
    }
  ),

  -- bigcup
  s({trig="bigcup", snippetType="autosnippet", desc="Bigcup with limits", wordTrig=false, condition=inMathMode},
    fmta([[\bigcup<><><> ]],
      {
        f(returnIfNotEmpty, {1}, {user_args = {"_{"}}),
        i(1),
        d(2, function(args)
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
          {1}
        ),
      }
    )
  ),

  -- bigcap
  s({trig="bigcap", snippetType="autosnippet", desc="Bigcap with limits", wordTrig=false, condition=inMathMode},
    fmta([[\bigcap<><><> ]],
      {
        f(returnIfNotEmpty, {1}, {user_args = {"_{"}}),
        i(1),
        d(2, function(args)
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
          {1}
        ),
      }
    )
  ),

  -- inf
  s({trig="inf", snippetType="snippet", desc="Infimum", wordTrig=false, condition=inMathMode},
    fmta([[\inf<><><> ]],
      {
        f(returnIfNotEmpty, {1}, {user_args = {"_{"}}),
        i(1),
        f(returnIfNotEmpty, {1}, {user_args = {"}"}})
      }
    )
  ),

  -- sup
  s({trig="sup", snippetType="snippet", desc="Supremum", wordTrig=false, condition=inMathMode},
    fmta([[\sup<><><> ]],
      {
        f(returnIfNotEmpty, {1}, {user_args = {"_{"}}),
        i(1),
        f(returnIfNotEmpty, {1}, {user_args = {"}"}})
      }
    )
  ),

  -- sqrt, root (root)
  s({trig="root", snippetType="autosnippet", desc="Square root or general root", wordTrig=false, condition=inMathMode},
    {
      c(1, {
        sn(nil, fmta([[\sqrt{<>} ]], {r(1, "r1")})),
        sn(nil, fmta([[\sqrt[<>]{<>} ]], {r(1, "r2"), r(2, "r1")})),
      }),
    }, {
      stored = {
        ["r1"] = i(1),
        ["r2"] = i(2)
      }
    }
  ),
}
