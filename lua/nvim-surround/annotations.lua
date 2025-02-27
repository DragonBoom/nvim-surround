--[====================================================================================================================[
                                                   Basic Definitions
--]====================================================================================================================]

---@alias text string[] A list of lines of text in the buffer
---@alias position integer[] A 1-indexed position in the buffer
---@alias delimiter string[] The text representation of a delimiter
---@alias delimiter_pair delimiter[] A pair of delimiters
---@alias add_func fun(char?: string): delimiter_pair?
---@alias find_func fun(char?: string): selection?
---@alias delete_func fun(char?: string): selections?
---@alias change_table { target: delete_func, replacement: add_func? }

---@class selection
---@field first_pos position
---@field last_pos position

---@class selections
---@field left selection?
---@field right selection?

--[====================================================================================================================[
                                                    Internal Options
--]====================================================================================================================]

-- TODO: Come up with a better name for `change_table`?
---@class surround
---@field add add_func
---@field find find_func
---@field delete delete_func
---@field change change_table

---@class options
---@field keymaps table<string, string>
---@field surrounds table<string, surround>
---@field aliases table<string, string|string[]>
---@field highlight { duration: integer }
---@field move_cursor false|"begin"|"end"
---@field indent_lines function

--[====================================================================================================================[
                                                 User-provided options
--]====================================================================================================================]

---@alias user_add false|string[]|string[][]|add_func
---@alias user_find false|string|find_func
---@alias user_delete false|string|delete_func
---@alias user_change false|{ target: user_delete, replacement: user_add? }

---@class user_surround
---@field add user_add
---@field find user_find
---@field delete user_delete
---@field change user_change

-- TODO: Can we find a way to unify the `false|` into user_surrounds? It would make more sense, since `false` is
-- something that the user is directly passing to the setup function. See user_* for an example.
---@class user_options
---@field keymaps table<string, false|string>
---@field surrounds table<string, false|user_surround>
---@field aliases table<string, false|string|string[]>
---@field highlight { duration: false|integer }
---@field move_cursor false|"begin"|"end"
---@field indent_lines false|function
