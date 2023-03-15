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
local file_pattern = "*.cpp"


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

-- local if_statement = s("if", fmt(
--     [[
-- if({}){}
--     ]],
-- {
--     i(1, ""),
--     i(2, ""),
-- })
-- )
-- table.insert(autosnippets, if_statement)


local For_satement = s( -- for([%w_]) CPP For Loop snippet{{{
	{ trig = "for([%w_])", regTrig = true, hidden = true },
	fmt(
		[[
for(int {} = 0; {} < {}; {}++){{
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
-- local While_staement = s( -- [while] CPP While Loop snippet{{{
-- 	"while",
-- 	fmt(
-- 		[[
-- while({}){{
--     {}
-- }}
--   ]],
-- 		{
-- 			i(1, ""),
-- 			i(2, ""),
-- 		}
-- 	)
-- ) --}}}
table.insert(autosnippets, For_satement)
-- table.insert(autosnippets, While_staement)
table.insert(autosnippets, cp)
table.insert(autosnippets, Cp)
table.insert(autosnippets, Date)
table.insert(autosnippets, myFirstSnippet)

local graph_class = s("graph_class", fmt(
[[
struct Edge{{
	int src;
	int des;
}};

struct Graph{{
	vector< vector<int> > adjList;
	Graph(const vector<Edge> &edges, int n){{
		adjList.resize(n);
		for(const Edge& i:edges){{
			adjList[i.src].push_back(i.des);
			adjList[i.des].push_back(i.src);
		}}
	}}
	Graph(const vector<vector<int>> &adjlist){{
		adjList = adjlist;
	}}
}};
{}
]],
{
    i(1, ""),
}
))

table.insert(snippets, graph_class)

local bfs_algorithm = s("bfs_algorithm", fmt(
[[
vector<bool>visited(1000,false);

vector<int> bfs(const Graph &graph, int start, int target = -1){{
	int n = graph.adjList.size();
	vector<int>order;
	queue<int>q;
	q.push(start);
	visited[start] = true;
	while(!q.empty()){{
		int u = q.front();
		q.pop();
		order.push_back(u);
		for(int i:graph.adjList[u]){{
			if(!visited[i]){{
				visited[i] = true;
				q.push(i);
			}}
		}}
	}}
	if(target!=-1){{
		if(!visited[target]) return {{}};
	}}
	return order;
}}
{}
]],
{
    i(1, ""),
}
))

-- End Refactoring --

return snippets, autosnippets


