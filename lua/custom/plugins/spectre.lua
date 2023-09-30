local M = {
  'nvim-pack/nvim-spectre',
  config = function()
    require('spectre').setup({
      color_devicons = true,
      is_insert_mode = false,
      live_update = true,
    })
  end
}

M.spectre_state = require('spectre.actions').get_state()
M.is_file = M.spectre_state.query.is_file
M.path = M.spectre_state.query.path
M.replace_query = M.spectre_state.query.replace_query
M.search_quey = M.spectre_state.query.search_quey

M.search_resume = function()
  M.spectre_state = require('spectre.actions').get_state()
  M.is_file = M.spectre_state.query.is_file
  M.path = M.spectre_state.query.path
  M.replace_query = M.spectre_state.query.replace_query
  M.search_query = M.spectre_state.query.search_query
  require('spectre').open({
    search_text = M.search_query,
    replace_text = M.replace_query,
    path = M.path,
  })
end

return M
