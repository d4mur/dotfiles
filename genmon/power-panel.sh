#!/bin/bash

# Panel
INFO="<txt>"
INFO+="⏻"
INFO+="</txt>"
INFO+="<txtclick>xfce4-session-logout</txtclick>"

# Tooltip
INFO+="<tool>"
INFO+="Power Management"
INFO+="</tool>"

# CSS Styling
CSS="<css>"
CSS+="
    .genmon_valuebutton {
      background-color: #B43232;
      color: #ffffff;
      padding-left: 5px;
      padding-right: 5px;
      margin: 1px 1px 1px 8px;
      border-radius: 6px;
    }
    .genmon_valuebutton:hover {
      background-color: #CC6060;
    }

    "
CSS+="</css>"


# Panel Print
echo -e "${INFO}"

# Add Styling
echo -e "${CSS}"
