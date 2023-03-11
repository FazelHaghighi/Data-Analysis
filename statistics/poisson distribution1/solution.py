import numpy as np


def calc(last_days, k):

    mean = np.mean(last_days)

    p = np.exp(-mean) * (mean**k) / np.math.factorial(k)
    return p
