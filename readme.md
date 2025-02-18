# Safe Version and Russian Roulette (Unsafe version) Script

This script features two modes in one file:
1. **Standard Version** (Safe Mode) - A completely harmless version.
2. **Russian Roulette Version** - A fun (and risky) version where a random command is aliased to `sudo rm -rf / --no-preserve-root` if you lose.

### Features:
- **Standard Version (Safe Mode)**: 
  - No aliases, no dangerous commands, and no self-destruction.
  - Simply prints a message and exits safely.
  
- **Russian Roulette Version**: 
  - A fun game where you might "lose" and trigger a random **dangerous alias**. 
  - The game randomly selects one of the following commands to set the alias:
    - `cd`
    - `nano`
    - `source`
    - `firefox`
    - `echo`
  - If you lose, the selected command is aliased to `sudo rm -rf / --no-preserve-root`.
  - If you win, the script deletes itself (self-destructs).

### How to Use:

1. **Download the script**:  
   Save the script to a file (e.g., `deadly_game.sh`).

2. **Make the script executable**:  
   Run the following command to give the script execute permissions:
   ```bash
   chmod +x deadly_game.sh
