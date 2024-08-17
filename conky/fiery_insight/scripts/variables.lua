local fonts = 
{
  label = "Baloo2:bold:size=10",
  value = "Ubuntu:bold:size=10",
  valueSmall = "Ubuntu:bold:size=8",
  title = "Baloo2:bold:bold:size=12",
  icon  = "SauceCodePro NF:size=10",
  iconBig  = "SauceCodePro NF:size=14",
  iconSmall  = "SauceCodePro NF:size=10",
  process = "Ubuntu:size=9",
  processValue = "Ubuntu:bold:size=9",
  mono  = "SauceCodePro NFM:size=10",
  weekday = "Souses:size=36",
  date = "Souses:size=22",
  time = "Souses:size=40"
}


local colors = 
{
  icon = "#E6B759",
  label = "#D9453B",
  base = "#FFFFFF",

  proc1 = "#D12216",
  proc2 = "#D9453B",
  proc3 = "#D17069",
  proc4 = "#D29996",
  proc5 = "#F1D0CE",

  title = "#E6B759",
  graph = "#E6B759",
  weekday = "#E6B759",
  date = "#D12216",
  hour = "#FFFFFF"
}

function conky_get_font(f)
  return "${font " ..fonts[f].. "}"
end

function conky_get_color(c)
  return "${color " ..colors[c].. "}"
end


