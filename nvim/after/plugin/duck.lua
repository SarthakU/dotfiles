local animals = { "🦆", "ඞ", "🦀", "🐈", "🐎", "🦖", "🐤" }

vim.keymap.set('n', '<leader>DH', function() require("duck").hatch(animals[math.random(1, 7)], 3) end, {})
vim.keymap.set('n', '<leader>DC', function() require("duck").cook() end, {})
