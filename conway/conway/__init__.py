"""Simple Conway game of life



"""

import time
from .step import conway_step


def conway_loop(grid):
    """Play Conways game of life on repeat
    """
    while True:
        try:
            grid = conway_step(grid)
            print(grid)
            time.sleep(1)

        except KeyboardInterrupt:
            print("Done")
            break
