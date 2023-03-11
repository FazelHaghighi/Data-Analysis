import matplotlib.pyplot as plt

sample = [
    2.2754304298033476,
    3.8737980181951115,
    7.7898809533888045,
    1.5193831488887166,
    2.022372069091202,
    5.6174531328315656,
    3.1095929731395398,
    4.187964232847153,
    2.3351935796757326,
    5.6663102942997,
]


def cdf(sample):
    x = sorted(sample)
    y = [i / len(x) for i in range(1, len(x) + 1)]
    return x, y


print(cdf(sample))

x, y = cdf(sample)
plt.plot(x, y, label="CDF")
plt.legend()
plt.show()
