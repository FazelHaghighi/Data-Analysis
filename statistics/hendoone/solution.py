import numpy as np
from scipy.stats import norm

my_list = [int(i) for i in input().split()]
k = float(input())

healthy = 0

for i in range(len(my_list)):
    if my_list[i] == 1:
        healthy += 1

n = len(my_list)
p = 0.93
q = 1 - p

sigma = np.sqrt(n * p * q)
mean = n * p

threshold = norm.ppf((1 - k) / 2)

z = mean + sigma * threshold / np.sqrt(n)

if healthy >= z:
    print("ACCEPT")
else:
    print("REJECT")
