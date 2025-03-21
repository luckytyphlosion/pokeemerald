import collections
import sortedcontainers
import math

class MoveAnimTimestamp:
    __slots__ = ("attacker", "target", "frame_num")

    def __init__(self, attacker, target, frame_num):
        self.attacker = attacker
        self.target = target
        self.frame_num = frame_num

class MoveAnimTimestamps:
    __slots__ = ("name", "timestamps")

    def __init__(self, name):
        self.name = name.replace("MOVE_", "Move_")
        self.timestamps = sortedcontainers.SortedList(key=lambda x: (x.attacker, x.target))

def frame_to_timestamp(frame_num):
    num_seconds = math.floor(frame_num / 59.7275005696058)
    if num_seconds < 3600:
        minutes_part = num_seconds // 60
        seconds_part = num_seconds % 60
        timestamp_str = f"{minutes_part:d}:{seconds_part:02d}"
    else:
        hours_part = num_seconds // 3600
        remaining_seconds = num_seconds % 3600
        minutes_part = remaining_seconds // 60
        seconds_part = remaining_seconds % 60
        timestamp_str = f"{hours_part:d}:{minutes_part:02d}:{seconds_part:02d}"

    return timestamp_str

def main():
    ONE_TIMESTAMP_PER_MOVE = False
    all_move_anim_timestamps = {}

    with open(<path to timestamp dump>, "r") as f:
        for line in f:
            line = line.strip()
            if line[0] != "~":
                cur_move_index_str, move_name = line.split(",", maxsplit=1)
                cur_move_index = int(cur_move_index_str)
                if cur_move_index in all_move_anim_timestamps:
                    raise RuntimeError()
                move_anim_timestamps = MoveAnimTimestamps(move_name)
                all_move_anim_timestamps[cur_move_index] = move_anim_timestamps
            else:
                line = line[1:]
                attacker_str, target_str, frame_num_str = line.split(",", maxsplit=2)
                move_anim_timestamps.timestamps.add(MoveAnimTimestamp(int(attacker_str), int(target_str), int(frame_num_str)))

    output = []

    for cur_move_index, move_anim_timestamps in sorted(all_move_anim_timestamps.items(), key=lambda x: x[0]):
        if ONE_TIMESTAMP_PER_MOVE:
            move_anim_timestamp = move_anim_timestamps.timestamps[0]
            output.append(f"{move_anim_timestamps.name}:\n- {frame_to_timestamp(move_anim_timestamp.frame_num)}\n")
        else:
            output.append(f"{move_anim_timestamps.name}:\n- ")
            output.append(" | ".join(f"({move_anim_timestamp.attacker},{move_anim_timestamp.target}): {frame_to_timestamp(move_anim_timestamp.frame_num)}" for move_anim_timestamp in move_anim_timestamps.timestamps))
            output.append("\n")

    if ONE_TIMESTAMP_PER_MOVE:
        filename = "format_move_anim_timestamps_short_out.txt"
    else:
        filename = "format_move_anim_timestamps_out.txt"

    with open(filename, "w+") as f:
        f.write("".join(output))

if __name__ == "__main__":
    main()
