import subprocess
import os
import pathlib

def main():
    total_size = 0
    total_compressed_size = 0

    with open("input_icons.txt", "r") as f:
        for line in f:
            line = line.strip()
            filename_suffix, width_str, height_str, file_type = line.split(",")
            if file_type == "OBJEVENT":
                folder = "graphics/object_events/pics/"
            elif file_type == "FLDEFF":
                folder = "graphics/field_effects/pics/"
            elif file_type == "POKEMON":
                folder = "graphics/pokemon/"
            elif file_type == "FQPN":
                folder = ""
            elif file_type == "MISC":
                folder = "graphics/misc/"
            else:
                raise RuntimeError(file_type)

            width = int(width_str)
            height = int(height_str)

            filename = f"{folder}{filename_suffix}"
            filepath = pathlib.Path(filename)
            if not filepath.exists():
                print(f"Warning: {filename} does not exist.")
                continue

            if (width, height) not in {(2, 2), (2, 4), (4, 4), (8, 8)}:
                print(f"Warning: {filename} has invalid dimensions ({width},{height})")
                continue

            uncompressed_size = filepath.stat().st_size
            
            compressed_filename = f"{filename}.sz"
            compressed_filepath = pathlib.Path(compressed_filename)
            if not compressed_filepath.exists():
                args = ["tools/spritecomp/spritecomp", filename, compressed_filename, "-mwidth", width_str, "-mheight", height_str]
                #print(args)
                subprocess.run(args, check=True)

            compressed_size = compressed_filepath.stat().st_size
            total_size += uncompressed_size
            total_compressed_size += compressed_size

    print(f"compressed / uncompressed: {total_compressed_size} / {total_size}")

if __name__ == "__main__":
    main()
