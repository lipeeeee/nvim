-- Read file data
local function read_file_data(file_path)
  local data = ""
  local f = io.open(file_path, "r")
  if f ~= nil then
    data = f:read()
    io.close(f)
  end
  return data
end

-- Override file data
local function override_file_data(file_path, data)

end

-- Tries to create file
local function create_file(file_path, data)
  local f = io.open(file_path, "w")
  if f ~= nil then
    f:write(data)
    io.close(f)
  end
end

-- Checks if file exists
local function file_exists(file_path)
  local f = io.open(file_path, "r")
  return f ~= nil and io.close(f)
end

return {
  read_file_data = read_file_data,
  override_file_data = override_file_data,
  create_file = create_file,
  file_exists = file_exists,
}
