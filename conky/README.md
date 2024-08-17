## Fonts Required

To achieve the full aesthetic of the FieryInsight configuration, you need to download and install the following fonts:

1. **Baloo 2**  
   **Link**: [Baloo 2 on Google Fonts](https://fonts.google.com/specimen/Baloo+2)

2. **Ubuntu**  
   **Link**: [Ubuntu on Google Fonts](https://fonts.google.com/specimen/Ubuntu)

3. **Nerd Fonts (Source Code Pro)**  
   **Link**: [Nerd Fonts Download](https://www.nerdfonts.com/font-downloads)

4. **Souses**  
   **Link**: [Souses Font Download](https://www.fonttr.com/souses-font)

### Set Up the Conky Configuration

1. **Copy the FieryInsight Directory**

   - Download or clone the FieryInsight Conky configuration files.
   - Copy the `fiery_insight` directory into your home directory under `~/.conky/`:
     ```bash
     mkdir -p ~/.conky
     cp -r path/to/fiery_insight ~/.conky/
     ```

2. **Start Conky**

   - Navigate to the directory where the `start-conky.sh` script is located.
   - Ensure the script is executable:
     ```bash
     chmod +x start-conky.sh
     ```
   - Run the script to start Conky:
     ```bash
     ./start-conky.sh
     ```
