from cython.view cimport array as cvarray

import numpy as np
cimport numpy as np

def eval_pixel(
        int row,
        int col,
        int[:, :] grid,
        int[:, :] next_grid):
    """Follows the rules of Conway's game of life to
    flip (or not) a pixel in a grid
    """
    cdef int n = grid.shape[0]
    cdef int m = grid.shape[1]
    cdef int i = max(row-1, 0)
    cdef int j = min(n, row+2)

    cdef int k = max(col-1, 0)
    cdef int l = min(m, col+2)


    cdef int[:, :] sub_grid = grid[i:j, k:l]

    cdef int sum_ = 0
    for u in range(j - i):
        for v in range(k - l):
            sum_ += sub_grid[u, v]

    if grid[row, col] and not (2 < sum_ < 5):
        next_grid[row, col] = 0
    elif sum_ == 3:
        next_grid[row, col] = 1


def conway_step(int[:, :] grid):
    """Applies Conway's rule for every pixel on a grid
    """
    cdef int n = grid.shape[0]
    cdef int m = grid.shape[1]
    cdef int[:, :] next_grid = grid.copy()
    cdef int i, j
    for i in range(n):
        for j in range(m):
            eval_pixel(i, j, grid, next_grid)
    return next_grid
