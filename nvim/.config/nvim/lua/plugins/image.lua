-- TODO: add custom function to search for images on all the directories

function url_decode(str)
  str = str:gsub("+", " ")  -- convert '+' to space
  str = str:gsub("%%(%x%x)", function(hex)
    return string.char(tonumber(hex, 16))
  end)
  return str
end

return {
  "3rd/image.nvim",
  build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
  opts = {
    processor = "magick_cli",
    backend = "kitty",

    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = false,
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = "popup", -- or "inline"
        floating_windows = true, -- if true, images will be rendered in floating markdown windows
        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
        resolve_image_path = function(document_path, image_path, fallback)
          -- document_path is the path to the file that contains the image
          -- image_path is the potentially relative path to the image. for
          -- markdown it's `![](this text)`
          --   -- Search recursively for the first match under cwd
          local cwd = vim.fn.getcwd()

          local results = vim.fs.find(
            function(name, path)
              -- print(url_decode(image_path))
              return vim.fs.basename(name) == vim.fs.basename(url_decode(image_path))
            end,
            {
              path = cwd,
              type = "file",
              limit = 1,
              upward = false,  -- only look downward
            }
          )

          if #results > 0 then
            return results[1]
          end

          -- you can call the fallback function to get the default behavior
          return fallback(document_path, image_path)
        end,
      },
      neorg = { enabled = true, filetypes = { "norg" }, },
      typst = { enabled = true, filetypes = { "typst" }, },
      html = { enabled = false, },
      css = { enabled = false, },
    },

    max_width = nil,
    max_height = nil,
    max_width_window_percentage = 80, max_height_window_percentage = 50,
    scale_factor = 1.0,
    window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
    editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
    tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
  },
}
