import numpy as np


def eval_pixel(row, col, grid, next_grid):
    """Follows the rules of Conway's game of life to
    flip (or not) a pixel in a grid
    """
    n, m = grid.shape
    sub_grid = grid[
        max(row - 1, 0) : min(n, row + 2), max(col - 1, 0) : min(m, col + 2)
    ]
    if grid[row, col] and not (2 < sub_grid.sum() < 5):
        next_grid[row, col] = 0
    elif sub_grid.sum() == 3:
        next_grid[row, col] = 1


def conway_step(grid):
    """Applies Conway's rule for every pixel on a grid
    """
    ii, jj = np.meshgrid(np.arange(grid.shape[0]), np.arange(grid.shape[1]))

    next_grid = grid.copy()
    for i, j in zip(ii.ravel(), jj.ravel()):
        eval_pixel(i, j, grid, next_grid)
    return next_grid
