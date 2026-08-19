# 💻 Offline Code Generator --- USB Edition

### Local AI Coding Assistant for Windows

[![Model](https://img.shields.io/badge/Model-Qwen2.5--Coder--1.5B-orange?style=flat)](https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF)
[![Format](https://img.shields.io/badge/Format-GGUF-blue?style=flat)](https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF)
[![Runtime](https://img.shields.io/badge/Runtime-llama.cpp-green?style=flat)](https://github.com/ggerganov/llama.cpp)
[![Platform](https://img.shields.io/badge/OS-Windows%2010%20%7C%2011-blue?style=flat&logo=windows)](https://www.microsoft.com/windows/)
\[![Mode](https://img.shields.io/badge/Mode-Offline-success?style=flat)\]
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat)](LICENSE)

------------------------------------------------------------------------

## 📖 Overview

**Offline Code Generator** is a lightweight local AI coding assistant
designed to run directly on Windows without requiring cloud AI services,
API keys, Ollama, Python, Node.js, or npm.

The project uses a local **GGUF coding model** and a native inference
runtime to provide code generation, programming assistance, SQL/DBMS
help, PHP support, debugging, and general development questions directly
on the user's machine.

The application is designed as a **USB-friendly portable project**: copy
the project folder to a compatible Windows PC, place the required model
and engine files in their designated directories, and launch the
application using the included `.bat` files.

### Purpose

-   **Local AI Assistance**: Run coding inference locally without
    sending prompts to a cloud service.
-   **Simple Deployment**: Avoid large application stacks such as Python
    environments, Node.js installations, pip packages, and Ollama.
-   **Programming Support**: Generate and debug code across common
    programming languages.
-   **DBMS Assistance**: Create SQL queries, tables, joins,
    relationships, and explain database concepts.
-   **Portable Usage**: Keep the project self-contained so it can be
    moved between compatible Windows systems.

------------------------------------------------------------------------

## ✨ Features

### 🚀 Core Experience

-   **Offline Code Generation**: Generate code locally using a GGUF
    instruction-tuned coding model.
-   **Terminal Mode**: Run the coding assistant directly from Windows
    Terminal/Command Prompt.
-   **Web Mode**: Start a local AI server and access the assistant
    through a browser.
-   **No Cloud API**: No OpenAI, Gemini, or other remote AI API is
    required for inference.
-   **No Ollama Dependency**: The project communicates directly with the
    local inference runtime.
-   **Configurable Model**: Replace the GGUF model later without
    redesigning the project.
-   **Code + DBMS Assistance**: Supports programming questions, SQL,
    database design, and common DBMS concepts.
-   **Portable Runtime**: Runtime binaries and required DLLs are stored
    inside the project.

------------------------------------------------------------------------

### 🎨 Interface Modes

  -----------------------------------------------------------------------
  Mode                    Description             Core Technology
  ----------------------- ----------------------- -----------------------
  **Terminal Mode**       Direct interactive      `llama-cli.exe`,
                          local model generation  Windows Batch
                          from the command line.  

  **Web Mode**            Browser-based interface HTML5, CSS3,
                          connected to the local  JavaScript, local
                          inference server.       server

  **Launcher**            Central entry point for `START.bat`
                          selecting Terminal or   
                          Web mode.               
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 🤖 Model & Runtime

### Current Model

  -------------------------------------------------------------------------------
  Component                           Current Selection
  ----------------------------------- -------------------------------------------
  **Model**                           `Qwen2.5-Coder-1.5B-Instruct`

  **Format**                          GGUF

  **Quantization**                    `Q4_K_M`

  **Model File**                      `qwen2.5-coder-1.5b-instruct-q4_k_m.gguf`

  **Context**                         `4096` tokens

  **Primary Use**                     Code generation, debugging, SQL/DBMS and
                                      programming assistance
  -------------------------------------------------------------------------------

The official Qwen repository provides the `Q4_K_M` GGUF file and
documents usage with llama.cpp. The current Q4_K_M file is approximately
1.12 GB. [Official Qwen GGUF
repository](https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF)

The model is intentionally excluded from Git because of its size.

------------------------------------------------------------------------

## 📁 Project Directory Structure

``` text
OfflineCode:\
├── config\                              # Application configuration
│   └── config.json                      # Model and runtime settings
│
├── engine\                              # Local inference runtimes
│   ├── llama-cli.exe                    # Terminal inference
│   ├── llama-server.exe                 # Local web server
│   ├── llamafile-0.10.5.exe             # Web runtime when using llamafile
│   ├── llama*.dll                       # llama.cpp runtime libraries
│   ├── ggml*.dll                        # GGML runtime libraries
│   └── other required runtime files
│
├── models\                              # Local AI model storage
│   ├── .gitkeep                          # Keeps the folder in Git
│   └── qwen2.5-coder-1.5b-instruct-q4_k_m.gguf
│
├── prompts\                             # Model behavior configuration
│   └── system.txt                       # System prompt
│
├── START.bat                            # Main application launcher
├── TERMINAL.bat                         # Terminal mode launcher
└── WEB.bat                              # Web mode launcher
```

> **Note:** The exact executable used by `WEB.bat` depends on the
> current web implementation. Keep the runtime files together inside
> `engine\`.

------------------------------------------------------------------------

## 🛠️ Technical Specifications

### Core Runtime

-   **Model Runtime**: Native llama.cpp-compatible inference
-   **Model Format**: GGUF
-   **Current Model**: Qwen2.5-Coder-1.5B-Instruct
-   **Quantization**: Q4_K_M
-   **Terminal Runtime**: `llama-cli.exe`
-   **Web Runtime**: `llama-server.exe` or `llamafile-0.10.5.exe`,
    depending on the launcher configuration
-   **Frontend**: Vanilla HTML5, CSS3 and JavaScript
-   **Launcher**: Windows Batch
-   **External Runtime Dependencies**: None intended

### Interface

-   **Terminal**: Direct local inference
-   **Web**: Local browser interface
-   **Default Local Host**: `127.0.0.1`
-   **Default Web Port**: Configured by the launcher and may be changed
    when a port conflict is detected

------------------------------------------------------------------------

## 📦 Installation & Setup

### 🟢 First-Time Setup

#### 1. Clone or download the repository

``` bash
git clone https://github.com/d-ghosh717/Offline-Code-Generator.git
cd OfflineCode-Code-Generator
```

Or download the repository as a ZIP and extract it.

------------------------------------------------------------------------

#### 2. Download the GGUF Model

The model is **not included in the Git repository**.

Download:

``` text
qwen2.5-coder-1.5b-instruct-q4_k_m.gguf
```

Official source:

[Qwen2.5-Coder-1.5B-Instruct-GGUF](https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF)

Place the downloaded file directly inside:

``` text
models\
```

The final path must be:

``` text
OfflineCode\
└── models\
    └── qwen2.5-coder-1.5b-instruct-q4_k_m.gguf
```

Do **not** place the model inside another subfolder.

------------------------------------------------------------------------

#### 3. Download the Web Runtime

If the current `WEB.bat` uses llamafile, download:

``` text
llamafile-0.10.5.exe
```

Official llamafile project:

[Mozilla AI llamafile](https://github.com/mozilla-ai/llamafile)

Place the executable directly inside:

``` text
engine\
```

The expected path is:

``` text
OfflineCode\
└── engine\
    └── llamafile-0.10.5.exe
```

Do not rename the executable unless `WEB.bat` is updated to use the new
filename.

------------------------------------------------------------------------

#### 4. Keep the llama.cpp Runtime Files Together

If the repository contains the native llama.cpp runtime files, keep the
entire runtime set inside:

``` text
engine\
```

This includes the required `.exe` and `.dll` files.

Do not randomly delete DLLs from `engine\`. Some executables depend on
them.

------------------------------------------------------------------------

## ▶ Run

### Main Launcher

Run:

``` text
START.bat
```

Choose:

``` text
[1] Terminal Mode
[2] Web Mode
```

### Terminal Mode

Run:

``` text
TERMINAL.bat
```

The model is loaded locally and prompts are processed without a cloud
API.

### Web Mode

Run:

``` text
WEB.bat
```

The launcher starts the configured local inference server and opens the
browser interface.

The web application is served locally and is intended to work without an
internet connection after the model and runtime files have been
installed.

------------------------------------------------------------------------

## 💡 Example Prompts

### Python

-   *Write a Python program to check whether a number is prime.*
-   *Create a Python program that reads a CSV file and calculates the
    average.*

### SQL / DBMS

-   *Create a MySQL table named students with id, name, email and
    department.*
-   *Explain the difference between a primary key and a foreign key.*
-   *Write a SQL query to find students enrolled in more than 3
    courses.*
-   *Create tables for a many-to-many relationship between students and
    courses.*

### PHP

-   *Write PHP code using PDO to connect to MySQL.*
-   *Create a PHP registration form with MySQL database insertion.*
-   *Fix this PHP database connection error.*

### C / C++

-   *Write a C program to sort an array using bubble sort.*
-   *Create a C++ program implementing a stack using a class.*

### Java

-   *Create a Java program for student grade calculation.*
-   *Explain inheritance in Java with an example.*

### Debugging

-   *Fix this Python code and return only the corrected code.*

------------------------------------------------------------------------

## 🛠 Troubleshooting

### Model not found

Verify that the exact model exists at:

``` text
models\qwen2.5-coder-1.5b-instruct-q4_k_m.gguf
```

Make sure the file was not renamed or placed inside another directory.

### Web runtime not found

If `WEB.bat` uses llamafile, verify:

``` text
engine\llamafile-0.10.5.exe
```

If it uses native llama.cpp, verify:

``` text
engine\llama-server.exe
```

and its required DLL files.

### Port already in use

A local port may already be occupied by another application.

Check a Windows port with:

``` bash
netstat -ano | findstr :8081
```

If the launcher supports automatic port selection, use the URL printed
by `WEB.bat`.

### Browser opens but the AI is not ready

The model may still be loading.

Wait until the local server reports that it is ready, then refresh the
browser.

### Generation is slow

CPU inference is naturally slower than cloud inference.

Performance depends on:

-   CPU model
-   Available RAM
-   Context size
-   Number of CPU threads
-   Model quantization
-   GPU acceleration, if configured

### Application works on one PC but not another

Check:

1.  Windows architecture
2.  Required engine files
3.  Model file
4.  Available RAM
5.  Port availability
6.  Windows security/antivirus restrictions
7.  The exact error shown by the launcher

The project is designed to minimize dependencies, but local AI inference
still depends on the host machine's available hardware resources.

------------------------------------------------------------------------

## 🔧 Manual Commands

### Test the Terminal Runtime

``` bash
engine\llama-cli.exe --help
```

### Run the Current Model Directly

``` bash
engine\llama-cli.exe -m "models\qwen2.5-coder-1.5b-instruct-q4_k_m.gguf" -c 4096 -n 2048
```

### Run the Current Llamafile Web Server

``` bash
engine\llamafile-0.10.5.exe --server --model "models\qwen2.5-coder-1.5b-instruct-q4_k_m.gguf" --no-mmap -c 4096 -np 1 --port 8081
```

Then open:

``` text
http://127.0.0.1:8081
```

> The manual llamafile command above reflects the currently tested
> configuration for this project.

------------------------------------------------------------------------

## 🗂️ Git & Model Files

The large GGUF model is intentionally excluded from Git.

The repository should contain:

``` text
models\
└── .gitkeep
```

while the local machine contains:

``` text
models\
├── .gitkeep
└── qwen2.5-coder-1.5b-instruct-q4_k_m.gguf
```

The `.gitignore` rule is:

``` gitignore
models/*.gguf
!models/.gitkeep
```

Therefore the model stays on the local machine and is not uploaded to
GitHub.

Do not force-add the model with:

``` bash
git add -f models/*.gguf
```

------------------------------------------------------------------------

## 🎯 Development Roadmap

### ✅ Completed

-   Fresh project architecture created.
-   Ollama dependency removed.
-   Local GGUF model support established.
-   Qwen2.5-Coder-1.5B-Instruct Q4_K_M tested successfully.
-   Native terminal inference working.
-   Windows batch launchers created.
-   Local web mode implemented.
-   Model files excluded from Git.
-   Runtime files organized under `engine\`.

### 🚧 In Progress

-   Improve cross-PC web startup reliability.
-   Improve automatic port detection.
-   Improve server readiness detection.
-   Improve web interface.
-   Improve model output formatting.
-   Add stronger error messages.

### 📅 Planned

-   Support easy model replacement.
-   Optional GPU acceleration where supported.
-   Better code formatting and copy/save controls.
-   Improved code-only generation behavior.
-   More robust Windows hardware compatibility checks.
-   Final USB-ready packaging and clean-PC testing.

------------------------------------------------------------------------

## 🤝 Contributing & Support

Contributions are welcome.

Suggested workflow:

1.  Create a feature branch:

``` bash
git checkout -b feature/new-feature
```

2.  Test the feature locally.
3.  Do not commit `.gguf` model files.
4.  Commit changes:

``` bash
git commit -m "Add new feature"
```

5.  Push the branch:

``` bash
git push origin feature/new-feature
```

6.  Open a pull request.

------------------------------------------------------------------------

## 📜 Licenses & Credits

### Qwen2.5-Coder

The current model is distributed by Qwen under the license specified in
the official model repository.

[Qwen2.5-Coder-1.5B-Instruct-GGUF](https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct-GGUF)

### llama.cpp

The local inference runtime is based on the llama.cpp project.

[llama.cpp](https://github.com/ggerganov/llama.cpp)

### llamafile

The optional web runtime uses Mozilla AI's llamafile project when
configured by `WEB.bat`.

[llamafile](https://github.com/mozilla-ai/llamafile)

------------------------------------------------------------------------

## 📌 Project Status

**Current Status:** Active Development

**Primary Platform:** Windows 10 / Windows 11

**Inference:** Local / Offline

**Current Model:** Qwen2.5-Coder-1.5B-Instruct Q4_K_M

**Primary Goal:** A simple, portable and reliable offline coding
assistant without unnecessary runtime dependencies.
