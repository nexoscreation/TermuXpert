Sure, here's a brief guide to ANSI escape codes for text formatting and coloring in the terminal:

- **Text Formatting:**
  - `\e[0m`: Reset all attributes.
  - `\e[1m`: Bold text.
  - `\e[2m`: Dim text.
  - `\e[4m`: Underlined text.
  - `\e[5m`: Blinking text.
  - `\e[7m`: Inverted colors (swap foreground and background).

- **Text Colors (Foreground):**
  - `\e[30m`: Black
  - `\e[31m`: Red
  - `\e[32m`: Green
  - `\e[33m`: Yellow
  - `\e[34m`: Blue
  - `\e[35m`: Magenta
  - `\e[36m`: Cyan
  - `\e[37m`: White

- **Background Colors:**
  - `\e[40m`: Black
  - `\e[41m`: Red
  - `\e[42m`: Green
  - `\e[43m`: Yellow
  - `\e[44m`: Blue
  - `\e[45m`: Magenta
  - `\e[46m`: Cyan
  - `\e[47m`: White

- **Combining Styles:**
  - For example, `\e[1;31m` sets bold red text.
  - You can combine different styles and colors.

Here's an example of a script that demonstrates different text formatting and coloring:

```bash
#!/bin/bash

echo -e "\e[1mBold Text\e[0m"
echo -e "\e[4mUnderlined Text\e[0m"
echo -e "\e[1;4mBold and Underlined Text\e[0m"

echo -e "\e[31mRed Text\e[0m"
echo -e "\e[42mGreen Background\e[0m"
echo -e "\e[1;33;41mBold Yellow Text on Red Background\e[0m"
```

Feel free to experiment with these codes to create your own custom styles and color schemes in your scripts. Adjust the escape codes based on your preferences and the look you want to achieve.
