def cdf(sample):
    x = sorted(sample)
    y = [i / len(x) for i in range(1, len(x) + 1)]
    return x, y
