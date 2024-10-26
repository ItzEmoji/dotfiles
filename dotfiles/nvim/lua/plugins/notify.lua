return {
    -- Other plugins...
    {
        "rcarriga/nvim-notify",  -- Add the nvim-notify plugin
        event = "VeryLazy",       -- Load it on a specific event (optional)
        config = function()
            require("notify").setup({
                -- Your notification options go here
                stages = "fade",
                timeout = 3000,
            })
        end,
    },
}
