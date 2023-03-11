import numpy as np
from scipy.stats import norm

my_list = [int(i) for i in input().split()]
k = float(input())

# sum = np.sum(my_list)
# var = np.var(my_list) * len(my_list)
# std = np.std(my_list)

# mu = len(my_list) * 0.93
# sigma = mu * 0.07

healthy = 0

for i in range(len(my_list)):
    if my_list[i] == 1:
        healthy += 1

threshold = abs(norm.ppf((1 - k) / 2))
# z = abs((sum - mu) / np.sqrt(sigma))

if healthy >= threshold:
    print("ACCEPT")
else:
    print("REJECT")
