local options = {
  ensure_installed = { "lua" , "rust", "typescript", "c" , "css", "html", "go"},
  prefer_git = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

return options
