# 🔐 Assembly XOR File Decryptor (Linux, x86)
**Created By:** Arthur Gipson  
Enivornment: Kali Linux Virtual Machine
📺 **YouTube Video:** [https://youtu.be/Ksyxgg80ALA](https://youtu.be/Ksyxgg80ALA)

This project is a simple, educational decryptor written entirely in **x86 Assembly**, designed to reverse XOR-encrypted files using raw **Linux system calls**.

> ✅ This project contains **only** decryption logic. There is **no encryption**, ransomware, or malicious behavior present.

## 🧠 Purpose
To demonstrate low-level systems programming:
- Linux syscalls: `open`, `read`, `lseek`, `write`, `close`
- Manual file buffer handling
- Symmetric XOR-based decryption
- Register and memory manipulation using NASM

## 🛠️ How It Works
In the video, the program targets a specific file, `victim.txt`, encrypts it using XOR (`0xAA`), and restores the original contents. However, I have only released the decryptor code on this GitHub.

## ⚠️ Disclaimer
This tool was created strictly for educational and research purposes. It is not intended for malicious use.
