require("config.lazy")
require("custom")

-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.g.fugitive_browse_handlers = {
  function(opts)
    -- Get Git remote URL (supports SSH/HTTPS)
    local repo_url = vim.fn['fugitive#repo'].config('remote.origin.url')

    -- Extract domain and path (supports git@domain:path and https://domain/path)
    local domain, path = repo_url:match([[git@(.+):(.+).git$]])
    if not domain then
      domain, path = repo_url:match([[https?://([^/]+)/(.+).git$]])
    end

    if domain and path then
      -- Remove '.git' suffix if present
      path = path:gsub('%.git$', '')

      -- Construct GitLab URL
      local revision = opts.revision or 'HEAD'
      local file_path = opts.file or ''

      -- Example: https://gitlab.my-company.com/group/project/-/blob/main/file.txt
      return string.format('https://%s/%s/-/blob/%s/%s', domain, path, revision, file_path)
    end

    -- Fallback to default handler if not GitLab
    return nil
  end,
}
