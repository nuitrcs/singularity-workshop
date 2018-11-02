#!/usr/bin/env python
import pandas as pd
import sys

df = pd.read_csv(sys.argv[1])

print("Evanston Arrests in 2018")
print("Mean age:", df['Age'].mean())
print("Racial breakdown (%):")
print(df['Race'].value_counts(normalize=True) * 100)