# Website Mirror Tool

A reusable Bash website downloader powered by wget.

## Features

- Interactive menu
- Full website mirroring
- Single page download
- Asset downloading
- Link conversion
- Resume support
- Logging
- ZIP export
- Download summary
- Dynamic project names


## Installation

```bash
git clone <your-folder>
cd website-mirror
chmod +x mirror.sh
Usage
./mirror.sh
Requirements
Ubuntu:

sudo apt install wget curl zip
Folder Output
Example:

website-mirror

downloads/
└── example-com/
    ├── index.html
    ├── css/
    ├── js/
    └── images/

logs/
└── download-2026-07-08.log
Notes
Only download websites you have permission to copy.
Dynamic applications may require browser automation tools.


---

## Final folder structure

```text
website-mirror/
│
├── mirror.sh
├── config.sh
│
├── lib/
│   ├── colors.sh
│   ├── utils.sh
│   ├── validator.sh
│   ├── downloader.sh
│   ├── logger.sh
│   ├── zipper.sh
│   ├── summary.sh
│   └── menu.sh
│
├── downloads/
├── logs/
└── README.md
Run:

chmod +x mirror.sh
./mirror.sh