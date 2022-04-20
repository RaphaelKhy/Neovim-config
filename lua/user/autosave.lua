local autosave = require("autosave")

autosave.setup(
  {
    enabled = true,
    execution_message = "",
    events = { "InsertLeave", "TextChanged" },
    conditions = {
      exists = true,
      filename_is_not = {},
      filetype_is_not = {},
      modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = false,
    clean_command_line_interval = 0,
    debounce_delay = 50 -- delay before autosave
  }
)
