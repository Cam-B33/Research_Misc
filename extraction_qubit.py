import math 
r = 1 
N = math.factorial(100) / (math.factorial(r) * math.factorial(100 - r))
n = 90
NA = math.factorial(n) / (math.factorial(r) * math.factorial(n - r))
X = NA / N
while X > 0.001:
    r += 1
    N = math.factorial(100) / (math.factorial(r) * math.factorial(100 - r))
    NA = math.factorial(n) / (math.factorial(r) * math.factorial(n - r))
    X = NA / N
 
print("The value of r for which X = 0.01 is ", r)
