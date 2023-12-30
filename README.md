# xSend 

A simple file sending CLI tool (Telegram Bot) built using Dart and Televerse!

![File Transfer](https://img.shields.io/badge/-File_Transfer-brightgreen)
![Telegram](https://img.shields.io/badge/-Televerse-blue)
![CLI Tool](https://img.shields.io/badge/-CLI_Tool-orange)
![Telegram Bot](https://img.shields.io/badge/-Telegram_Bot-lightgrey)
![Automation](https://img.shields.io/badge/-Automation-yellow)

## Overview

xSend is a simple Command-Line Interface (CLI) tool designed to streamline the process of sending files from your local machine to your Telegram account or chat. Whether you're sharing documents, images, or any other file, xSend makes the process quick and hassle-free.

## 📖 Usage

To use xSend, follow these simple steps:

1. **Build and Save the Binary:**
   - Build the xSend binary and save it in your system's PATH.

2. **Run the Command:**
   - Open your terminal and execute the following command:
     ```bash
     xsend -p <path-to-file>
     ```

3. **Bot Token Setup:**
   - Create a Telegram bot by interacting with [@BotFather](https://t.me/BotFather) and obtain the bot token.
   - Save the bot token as the environment variable `BOT_TOKEN`.

4. **Chat ID Setup:**
   - Get your Telegram Chat ID using [@myidbot](https://t.me/myidbot) or any other method.
   - Optionally, save the chat ID as the environment variable `CHAT_ID` for default settings.

5. **Send Files:**
   - Execute the xSend command with the path to the file you want to send:
     ```bash
     xsend -p <path-to-file> -c <chat-id>   # Specify chat ID if different from default
     ```

## 👷 Build Help

You can build the xSend binary using the following command:

```bash
dart compile exe bin/xsend.dart -o xsend
```

## Environment Variables

- `BOT_TOKEN`: Telegram bot token obtained from [@BotFather].
- `CHAT_ID` (Optional): Default chat ID for sending files. If not specified, the tool will prompt for a chat ID during execution.

## Example

```bash
xsend -p /path/to/myfile.txt -c 12345678
```

Feel free to contribute and enhance the functionality of xSend. If you encounter any issues or have suggestions, please open an issue on the [GitHub repository](https://github.com/HeySreelal/xSend).

Happy Sending! 🚀

