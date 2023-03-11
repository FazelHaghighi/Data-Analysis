import numpy as np


def p2p_distance(input):
    output = np.linalg.norm(input[:, None] - input, axis=-1)
    return output
