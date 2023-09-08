-- Gets time info(curDate, curTime)
local function GET_CURRENT_TIME_INFO()
  return {
    os_time = os.time(),
    date = os.date("%d-%m-%Y"),
    hour = os.date("%H:%M:%S")
  }
end

return {
  GET_CURRENT_TIME_INFO = GET_CURRENT_TIME_INFO
}
