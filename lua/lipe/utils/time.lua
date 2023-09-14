local date_format = "%d-%m-%Y"
local time_format = "%H:%M:%S"

-- Gets time info(os.time(), date, time)
local function get_current_time_info()
  return {
    os_time = os.time(),
    date = os.date("%d-%m-%Y"),
    time = os.date("%H:%M:%S")
  }
end

return {
	date_format = date_format,
	time_format = time_format,
	get_current_time_info = get_current_time_info,
}
