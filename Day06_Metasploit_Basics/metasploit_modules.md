# Metasploit Modules Overview

## Common Module Types

- **Auxiliary**: Non-exploit modules (e.g., scanners, fuzzers, sniffers).
- **Encoders**: Obfuscate payloads to evade antivirus detection.
- **Evasion**: Help evade antivirus/firewall detection using multiple techniques.
- **Exploits**: Exploitation modules categorized by platform and service.
- **Nops**: No Operation instructions; act as buffer fillers.
- **Payloads**:
  - **Singles**: Complete payloads (e.g., shell) in one piece.
  - **Stagers**: Setup network connection between attacker and victim.
  - **Stages**: Larger payloads that run after stager executes.
- **Post**: Post-exploitation modules used after access is gained (e.g., dumping passwords).

> 🔸 Example: An exploit + stager + stage = successful shell
