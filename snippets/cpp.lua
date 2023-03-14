local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local func = ls.function_node

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Cpp Snippets", { clear = true })
local file_pattern = "*.js"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

--All Snippets

local date = function() return {os.date('%d %b %Y  %H:%M:%S')} end

local Date = s("Date", func(date, {}))

local cp = s(
    { trig = "cp", regTrig = true, hidden = true}, 
    fmt(
    [[
/******************************************************************************
* Author:           Syed Tamal
* Created:          {} 
******************************************************************************/
#include <bits/stdc++.h>
using namespace std;
#define fastio ios::sync_with_stdio(false); cin.tie(nullptr);
#define int long long

void solve(){{
    {}	
}}

int32_t main(){{
	fastio
	int n;
	cin>>n;
	for(int i=1;i<=n;i++) solve();{}
}}
    ]],
    {
        sn(1, func(date, {})),
        i(3, ""),
        i(2, ""),
    }

    )
)

local Cp = s(
    { trig = "Cp", regTrig = true, hidden = false},
    fmt(
    [[
/******************************************************************************
* Author:           Syed Tamal
* Created:          {} 
******************************************************************************/
#include <bits/stdc++.h>
using namespace std;
#define fastio ios::sync_with_stdio(false); cin.tie(nullptr);
#define int long long

int32_t main(){{
	fastio
	int n;
	cin>>n;
	for(int i=1;i<=n;i++){{
        {}
    }}
}}
    ]],
    {
        sn(1, func(date, {})),
        i(2, ""),
    }

    )
)

local if_statement = s("if", fmt(
    [[
if({}){}
    ]],
{
    i(1, ""),
    i(2, ""),
})
)
table.insert(autosnippets, if_statement)


local For_satement = s( -- for([%w_]) CPP For Loop snippet{{{
	{ trig = "for([%w_])", regTrig = true, hidden = true },
	fmt(
		[[
for(int {} = 0; {} < {}; {}++) {{
  {}
}}
    ]],
		{
			d(1, function(_, snip)
				return sn(1, i(1, snip.captures[1]))
			end),
			rep(1),
			c(2, { i(1, "n"), sn(1, { i(1, "arr"), t(".size()") }) }),
			rep(1),
			i(3, ""),
		}
	)
) --}}}
local While_staement = s( -- [while] CPP While Loop snippet{{{
	"while",
	fmt(
		[[
while({}){{
  {}
}}
  ]],
		{
			i(1, ""),
			i(2, ""),
		}
	)
) --}}}
cs("cl", { t("console.log("), i(1, ""), t(")") }, { "jcl", "jj" }) -- console.log
table.insert(autosnippets, For_satement)
table.insert(autosnippets, While_staement)
table.insert(autosnippets, cp)
table.insert(autosnippets, Cp)
table.insert(autosnippets, Date)
table.insert(autosnippets, myFirstSnippet)

-- End Refactoring --

return snippets, autosnippets


