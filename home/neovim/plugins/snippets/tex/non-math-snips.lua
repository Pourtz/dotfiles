local function notInMathMode()
  return vim.api.nvim_eval('vimtex#syntax#in_mathzone()') == 0
end

local function returnIfNotEmpty(args, _, user_arg)
  if (args[1][1] ~= "") then
    return user_arg
  else
    return ""
  end
end

return {
-- Non-math snippets
  -- Inline math
  s({trig="mm", snippetType="autosnippet", desc="Inline math", condition=notInMathMode},
    fmta([[\(<>\)]], {i(1),})
  ),

  -- Display math
  s({trig="MM", snippetType="autosnippet", desc="Display math", condition=notInMathMode},
    fmta([[
      \[
        <>
      \]
      ]],
      {i(1),}
    )
  ),

  s({trig="over", snippetType="snippet", desc="Overline command"},
    fmta([[\overline{<>}]], {i(1),})
  ),

  s({trig="under", snippetType="snippet", desc="Underline command"},
    fmta([[\underline{<>}]], {i(1),})
  ),

  -- Quotation marks
  s({trig="qt", snippetType="snippet", desc="Quotation marks", condition=notInMathMode},
    fmta([[``<>'']], {i(1),})),

  -- Begin environment
  s({trig="begin", snippetType="snippet", desc="Begin and end an arbitrary environment"},
    fmta([[
      \begin{<>}
        <>
      \end{<>}
      ]],
      {i(1), i(2), rep(1),}
    )
  ),

  -- align (al)
  s({trig="align", snippetType="snippet", desc="Align environment", wordTrig=true, condition=notInMathMode},
    {
      c(1, {
        sn(nil, fmta([[
          \begin{align*}
            <>
          \end{align*}
          ]], {r(1, "r1")})),
        sn(nil, fmta([[
          \begin{align}
            <>
          \end{align}
          ]], {r(1, "r1")})),
      }),
    },
    {stored = {["r1"] = i(1),}}
  ),

  -- enumerate (en)
  s({trig="en", snippetType="snippet", desc="Enumerate environment", condition=notInMathMode},
    fmta([[
      \begin{enumerate}
        <>
      \end{enumerate}
      ]],
      {i(1)}
    )
  ),

  -- itemize (it)
  s({trig="it", snippetType="snippet", desc="Itemize environment", condition=notInMathMode},
    fmta([[
      \begin{itemize}
        <>
      \end{itemize}
      ]],
      {i(1)}
    )
  ),

  -- item (-)
  s({trig="-", snippetType="snippet", desc="Item", condition=notInMathMode},
   {t("\\item ")}
  ),

  -- TODO: Revisar si estos son todos los ambientes
  s({trig="def", snippetType="snippet", desc="Definition environment", condition=notInMathMode},
    fmta([[
      \begin{definicion}
        <>
      \end{definicion}
      ]],
      {i(1)}
    )
  ),

  s({trig="prop", snippetType="snippet", desc="Proposition environment", condition=notInMathMode},
    fmta([[
      \begin{prop}
        <>
      \end{prop}
      ]],
      {i(1)}
    )
  ),

  s({trig="lema", snippetType="snippet", desc="Lemma environment", condition=notInMathMode},
    fmta([[
      \begin{lema}
        <>
      \end{lema}
      ]],
      {i(1)}
    )
  ),

  s({trig="teo", snippetType="snippet", desc="Theorem environment", condition=notInMathMode},
    fmta([[
      \begin{teorema}
        <>
      \end{teorema}
      ]],
      {i(1)}
    )
  ),

  s({trig="coro", snippetType="snippet", desc="Corollary environment", condition=notInMathMode},
    fmta([[
      \begin{corolario}
        <>
      \end{corolario}
      ]],
      {i(1)}
    )
  ),

  s({trig="obs", snippetType="snippet", desc="Observation environment", condition=notInMathMode},
    fmta([[
      \begin{obs}
        <>
      \end{obs}
      ]],
      {i(1)}
    )
  ),

  s({trig="ejem", snippetType="snippet", desc="Example environment", condition=notInMathMode},
    fmta([[
      \begin{ejemplo}
        <>
      \end{ejemplo}
      ]],
      {i(1)}
    )
  ),

  s({trig="dem", snippetType="snippet", desc="Proof environment", condition=notInMathMode},
    fmta([[
      \begin{dem}
        <>
      \end{dem}
      ]],
      {i(1)}
    )
  ),

  s({trig="sol", snippetType="snippet", desc="Solution environment", condition=notInMathMode},
    fmta([[
      \begin{sol}
        <>
      \end{sol}
      ]],
      {i(1)}
    )
  ),

  -- label
  -- TODO: See label documentation
  s({trig="label", snippetType="snippet", desc="Label"},
    fmta([[\label{<>}]], {i(1),})
  ),

  -- ref
  -- TODO: See ref documentation
  s({trig="ref", snippetType="snippet", desc="Reference"},
    fmta([[\ref{<>}]], {i(1),})
  ),

  -- TODO: section, subsection, subsubsection (sec[n])

  -- cite
  -- TODO: See cite options in documentation
  s({trig="cite", snippetType="snippet", desc="Cite", condition=notInMathMode},
    fmta([[\cite{<>}]], {i(1),})
  ),

  -- TODO: figure (fig)

  -- usepackage (pkg)
  s({
    trig="pkg",
    snippetType="snippet",
    desc="Use package",
    condition=notInMathMode
  }, fmta([[\usepackage<><><>{<>}]], {
    f(returnIfNotEmpty, {1}, {user_args = {"["}}),
    i(2),
    f(returnIfNotEmpty, {1}, {user_args = {"]"}}),
    i(1),
  })),

  -- newcommand (newcommand)
  s({
    trig="cmd",
    snippetType="snippet",
    desc="New command",
    condition=notInMathMode,
  }, { c(1,{
    sn(nil, fmta([[\newcommand{\<>}{<>}]],
    {r(1, "name"), r(2, "content"),}
    )),
    sn(nil, fmta([[\newcommand{\<>}[<>]{<>}]],
    {
      r(1, "name"),
      r(2, "n-args"),
      r(3, "content"),
    }
    )),
    sn(nil, fmta([[\newcommand{\<>}[<>][<>][<>]{<>}]],
    {
      r(1, "name"),
      r(2, "n-args"),
      r(3, "n-opt-args"),
      r(4, "default-optional"),
      r(5, "content"),
    }
    )),
  }),}, {stored = {
    ["name"] = i(nil),
    ["content"] = i(nil),
    ["n-args"] = i(nil),
    ["n-opt-args"] = i(nil),
    ["default-optional"] = i(nil),
  }}),
}
