# =============================================================================
# Copyright (c) 2025 luckytyphlosion
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
# =============================================================================

import subprocess
import re

move_anim_start_regex = re.compile(r"^([0-9a-f]{8}) g\s+F\s+\.text\t+([0-9a-f]{8}) DoMoveAnim\b", flags=re.MULTILINE)
move_anim_end_regex = re.compile(r"^([0-9a-f]{8}) l\s+\.text\t+([0-9a-f]{8}) Cmd_waitanimation_done\b", flags=re.MULTILINE)
current_move_regex = re.compile(r"^([0-9a-f]{8}) g\s+O\s+\.ewram\.sbss\t+([0-9a-f]{8}) gCurrentMove\b", flags=re.MULTILINE)
battler_attacker_regex = re.compile(r"^([0-9a-f]{8}) g\s+O\s+\.ewram\.sbss\t+([0-9a-f]{8}) gBattlerAttacker\b", flags=re.MULTILINE)
battler_target_regex = re.compile(r"^([0-9a-f]{8}) g\s+O\s+\.ewram\.sbss\t+([0-9a-f]{8}) gBattlerTarget\b", flags=re.MULTILINE)
g_main_regex = re.compile(r"^([0-9a-f]{8}) g\s+O\s+\.iwram\.bss\t+([0-9a-f]{8}) gMain\b", flags=re.MULTILINE)

regexes = (move_anim_start_regex, move_anim_end_regex, current_move_regex, battler_attacker_regex, battler_target_regex, g_main_regex)

def main():
    raw_syms_as_str = subprocess.check_output(("arm-none-eabi-objdump", "-t", "pokeemerald-expansion.elf")).decode("utf-8")
    output = ""
    for i, regex in enumerate(regexes):
        addr = int(regex.search(raw_syms_as_str).group(1), 16)
        output += f"{addr}\n"

    with open("move_anim_breakpoints_config.dump", "r") as f:
        output_filename = f.read().strip()

    with open(output_filename, "w+") as f:
        f.write(output)

if __name__ == "__main__":
    main()
