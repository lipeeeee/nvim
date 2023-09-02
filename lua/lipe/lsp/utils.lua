local M = {}

function M.list_registered(filetype)
  local registered_providers = services.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

-- Gets all available linters for a specific language
function M.SUPPORTED_LINTERS(filetype)
  local s = require "null-ls.sources"
  local sl = s.get_supported(filetype, "diagnostics")
  table.sort(sl)
  return sl
end


function M.SUPPORTED_FORMATTERS(filetype)
  local s = require "null-ls.sources"
  local sf = s.get_supported(filetype, "formatting")
  table.sort(sf)
  return sf
end

return M
