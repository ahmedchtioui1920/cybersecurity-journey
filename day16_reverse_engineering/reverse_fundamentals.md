# Day 16 — Reverse Engineering (Binaries, Beginner Fundamentals)

This short guide covers practical, beginner-friendly fundamentals for **reverse engineering compiled binaries** (ELF/PE), focusing on static and dynamic analysis techniques and safe lab practice. 

---

## 1. Goals of Binary RE
- Understand what a program does without source code.  
- Find hidden functionality, input validation, or secrets.  
- Practice safe analysis in isolated VMs or sandboxes.

---

## 2. High-level Workflow
1. **Recon / Info:** file type, architecture, linked libraries.  
2. **Static analysis:** `strings`, `objdump`, `readelf`, decompiler (Ghidra/IDA).  
3. **Dynamic analysis:** run under `strace`/`ltrace`, then debug with `gdb` or `pwndbg`.  
4. **Hypothesis & test:** change inputs, set breakpoints, observe behavior.  
5. **Document findings** and produce a short PoC if needed (non-destructive).

---

## 3. Quick Tools & Commands (Linux / ELF focus)
- `file program` — shows architecture and type.  
- `readelf -h program` — ELF header (architecture, entry point).  
- `readelf -S program` — section table ('.text', '.rodata', '.data').  
- `objdump -d program | less` — disassemble `.text` (static view).  
- `strings program | less` — printable strings (quick clues).  
- `ldd program` — dynamic libraries used (only for dynamically linked binaries).

### Dynamic / Runtime
- `strace -o strace.log ./program args` — system call trace (file/network activity).  
- `ltrace -o ltrace.log ./program args` — library call trace (malloc, printf, strcmp).  
- `gdb ./program` — interactive debugger (set breakpoints, inspect memory/registers).  
  - Example `gdb` commands:
    - `break main` — set breakpoint at main.
    - `run [args]` — start program.
    - `print variable` / `x/32x $rsp` — inspect variables/memory.
    - `disas` — disassemble nearby code.

### Decompilers & GUI tools
- **Ghidra** — free decompiler + GUI, great for beginners.  
- **radare2 / Cutter** — powerful CLI + GUI (Cutter wrapper).  
- **IDA Free / IDA Pro** — industry standard (IDA Free limited).

---

## 4. Simple Example Workflow (safe, read-only)
Assume you have `vuln_bin` (lab binary).

1. Quick info:
```bash
file vuln_bin
readelf -h vuln_bin
strings vuln_bin | grep -i password
ldd vuln_bin
```

2. Static glance:
```bash
objdump -d vuln_bin | sed -n '1,200p'
```

3. Runtime observation:
```bash
strace -f -o strace.log ./vuln_bin "test input"
ltrace -o ltrace.log ./vuln_bin "test input"
```

4. Debugging (gdb):
```bash
gdb ./vuln_bin
# in gdb:
# (gdb) break main
# (gdb) run test
# (gdb) info registers
# (gdb) x/64x $rsp
# (gdb) disas
```

Interpretation tips:
- `strings` often reveals format strings, filenames, hidden messages.  
- `strace` shows files opened, network hosts contacted, and permission errors.  
- `ltrace` shows calls to `strcmp`/`printf` — useful for login checks.  
- Decompiler output (Ghidra) helps reconstruct high-level logic faster than raw assembly.

---

## 5. Safety & Ethics
- Only analyze binaries in labs or with explicit permission.  
- Use isolated VMs and disable network outbound (or use controlled sandbox).  
- Avoid running unknown binaries on your main machine.

---


## 6. Cheatsheet (one-liners)
```bash
file prog
strings prog | less
readelf -h prog
objdump -d prog | less
strace -f -o strace.log ./prog
ltrace -o ltrace.log ./prog
gdb ./prog
```

