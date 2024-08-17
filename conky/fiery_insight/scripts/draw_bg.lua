--[[  Background by londonali1010 (2009)
  VinDSL Background Hack (2010-2011)
  Anonymous contributions (2024)
]]

require 'cairo'
require 'cairo_xlib'


-- "corner_r" is the radius, in pixels, of the rounded corners. If you don't want rounded corners, use 0.
local corner_r = 25

-- Set the colour and transparency (alpha) of your background (0.00 - 0.99).
local bg_colour = 0x131416
local bg_alpha = 0.75

local border_colour = 0x4C3609
local border_alpha = 0.45
local border_width = 2.0

-- Tweaks the height of your background, in pixels. If you don't need to adjust the height, use 0.
--  (Default Setting)
local vindsl_hack_height = 0
local  cs, cr = nil

local function rgb_to_r_g_b(colour,alpha)
  return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function conky_draw_bg()
  if conky_window == nil then return end
  if cs == nil then cairo_surface_destroy(cs) end
  if cr == nil then cairo_destroy(cr) end
  local w = conky_window.width
  local h = conky_window.height
  local v = vindsl_hack_height
  local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
  local cr = cairo_create(cs)
  
  cairo_move_to(cr, corner_r, 0)
  cairo_line_to(cr, w - corner_r, 0)
  cairo_curve_to(cr, w, 0, w, 0, w, corner_r)
  cairo_line_to(cr, w, h + v - corner_r)
  cairo_curve_to(cr, w, h + v, w, h + v, w-corner_r, h + v)
  cairo_line_to(cr, corner_r, h + v)
  cairo_curve_to(cr, 0, h + v, 0, h + v, 0,h + v - corner_r)
  cairo_line_to(cr, 0, corner_r)
  cairo_curve_to(cr, 0, 0, 0, 0, corner_r, 0)
  cairo_close_path(cr)

  -- Draw the border
  cairo_set_source_rgba(cr, rgb_to_r_g_b(border_colour, border_alpha))
  cairo_set_line_width(cr, border_width)
  cairo_stroke(cr)
  
  
  
  -- Draw a text in the middle of the frame
  --[[
  local text = ""
  local font = "SauceCodePro NF"
  local font_size =  h * 0.74999943307122 -- px to pt transformation
  local text_color = 0xE6B759
  local text_alpha = 0.1  
  
  cairo_select_font_face(cr, font, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
  cairo_set_font_size(cr, font_size)
  local text_extents = cairo_text_extents_t:create()
  cairo_text_extents(cr, text, text_extents)

  -- Posiziona il testo al centro dell'area
  local text_x = (w - text_extents.width) / 2 - text_extents.x_bearing
  local text_y = (h - text_extents.height) / 2 + text_extents.height

  cairo_set_source_rgba(cr, rgb_to_r_g_b(text_color, text_alpha))
  
  cairo_move_to(cr, text_x, text_y)
  cairo_show_text(cr, text)
  ]]

  -- Reduce the path to fit with the border
  cairo_move_to(cr, corner_r + border_width / 2, border_width / 2)
  cairo_line_to(cr, w - corner_r - border_width / 2, border_width / 2)
  cairo_curve_to(cr, w - border_width / 2, border_width / 2, w - border_width / 2, border_width / 2, w - border_width / 2, corner_r + border_width / 2)
  cairo_line_to(cr, w - border_width / 2, h + v - corner_r - border_width / 2)
  cairo_curve_to(cr, w - border_width / 2, h + v - border_width / 2, w - border_width / 2, h + v - border_width / 2, w - corner_r - border_width / 2, h + v - border_width / 2)
  cairo_line_to(cr, corner_r + border_width / 2, h + v - border_width / 2)
  cairo_curve_to(cr, border_width / 2, h + v - border_width / 2, border_width / 2, h + v - border_width / 2, border_width / 2, h + v - corner_r - border_width / 2)
  cairo_line_to(cr, border_width / 2, corner_r + border_width / 2)
  cairo_curve_to(cr, border_width / 2, border_width / 2, border_width / 2, border_width / 2, corner_r + border_width / 2, border_width / 2)
  cairo_close_path(cr)

  cairo_set_source_rgba(cr, rgb_to_r_g_b(bg_colour, bg_alpha))
  cairo_fill(cr)

  cairo_surface_destroy(cs)
  cairo_destroy(cr)
end
