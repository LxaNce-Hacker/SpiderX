# <img src="ss/s1.png" alt="SpiderX Logo" width="150" height="150" /> SpiderX 

SpiderX is an advanced reconnaissance framework designed to streamline the process of extracting data and performing detailed cyber reconnaissance on a given target domain.

## Features
- Neon-themed user interface with glitch and animation effects.
- Automated data extraction from the [Wayback Machine](https://web.archive.org).
- Extracts and organizes:
  - Unique domains and subdomains.
  - URL paths excluding query parameters.
- Generates a comprehensive scan report.
- Built with a terminal-friendly interface for easy use.

## Prerequisites
Before running SpiderX, ensure you have the following installed on your system:
- **Bash Shell** (default on Linux and macOS)
- **`curl` Command-Line Tool**

## Installation
Clone the repository to your local system:

```bash
git clone https://github.com/LxaNce-Hacker/SpiderX.git
cd SpiderX
```

## Usage
Run the script with a target domain as the argument:

```bash
bash SpiderX.sh <domain>
```

### Example:
```bash
bash SpiderX.sh example.com
```

### Output:
- A directory named `HUNT_<target>_<timestamp>` will be created.
- Files generated in the directory:
  - `urls.txt`: List of all URLs found.
  - `domains.txt`: List of unique domains and subdomains.
  - `paths.txt`: List of unique URL paths.
  - `report.txt`: Comprehensive scan report.

## License
SpiderX is released under the [MIT License](LICENSE).

## Disclaimer
SpiderX is intended for educational and ethical purposes only. Unauthorized use of this tool for malicious activities is strictly prohibited. The developers are not responsible for any misuse of this tool.

## Contributions
Contributions are welcome! If you have ideas or suggestions to improve SpiderX, feel free to submit a pull request.

---
Developed with ❤️ by [LxaNce-Hacker](https://github.com/LxaNce-Hacker)
