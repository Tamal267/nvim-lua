require("telescope").setup({
	defaults = {
        file_ignore_patterns = {
            "dist/.*",
            "%.git/.*",
            "%.vim/.*",
            "%.jpg*",
            "%.jpeg*",
            "%.md*",
            "%.gif*",
            "%.ttf*",
            "Arduino/.*",
            "%.pdf*",
            "%.mp4*",
            "%.webm*",
            "%.png*",
            "node_modules/.*",
            "%.idea/.*",
            "%.history/.*"
        }	},
})
