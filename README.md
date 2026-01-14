# fuzzellij

Fuzzy-find [zellij](https://github.com/zellij-org/zellij) sessions

## Requirements

- [zellij](https://github.com/zellij-org/zellij)
- [fzf](https://github.com/junegunn/fzf)

## Installation

This is just a bash script, so:

1. Clone this repository

```
git clone https://github.com/noahsc0tt/fuzzellij
cd fuzzellij
```

2. Make the script executable

```
chmod +x fuzzellij.sh
```

3. Put it somewhere on your path

```
cp fuzzellij.sh /usr/local/bin/fzj
```

The filename should be the command you would like to invoke the tool with

## Usage

Run the name of the executable

```
Usage: fuzzellij [OPTIONS]

If no options are provided, the selected session name will be written to stdout.

Options:
  -l, --list        List all sessions
  -a, --attach      Attach to a session
  -k, --kill        Kill a session
  -d, --delete      Delete a session
  -h, --help        Show this help message
```
