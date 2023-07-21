local comment_status_ok, comment = pcall(require, "Comment")
if not comment_status_ok then
  return
end
local ts_context_commentstring_status_ok, ts_context_commentstring_integration = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not ts_context_commentstring_status_ok then
  return
end

comment.setup {
  pre_hook = ts_context_commentstring_integration.create_pre_hook(),
  toggler = {
    line = '<Leader>c<Leader>'
  },
  opleader = {
    line = '<Leader>c'
  }
}
