import numpy as np


def replace_odd(input):
    output = np.where(input % 2 == 1, -1, input)
    return output
