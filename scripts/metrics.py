"""
  Calculate various metrics for this config 
  
  - Lines of code
  - Number of files/directories
  - TBD
"""

import os
import subprocess
import time

ACCEPTED_FILE_EXTENSIONS = [ ".lua" ]

def count_lines_and_files(accepted_files, directory) -> tuple[int, int]:
    total_lines: int = 0
    total_files: int = 0
    for root, _, files in os.walk(directory):
        for file in files:
            _, file_extension = os.path.splitext(file)
            if file_extension in accepted_files:
                file_path = os.path.join(root, file)
                lines_count = int(subprocess.check_output(["wc", "-l", file_path]).decode().split()[0])
                total_lines += lines_count
                total_files += 1
    return (total_lines, total_files)

def measure_startup_time():
    start_time = time.time()
    subprocess.run(["nvim", "-c", "qall!"])
    end_time = time.time()
    startup_time = end_time - start_time
    return startup_time

if __name__ == "__main__":
    number_lines, number_files = count_lines_and_files(ACCEPTED_FILE_EXTENSIONS, ".") 
    #headless_startup_time = measure_startup_time()

    print(f"Config files: {number_files}")
    print(f"Lines of code: {number_lines}")

