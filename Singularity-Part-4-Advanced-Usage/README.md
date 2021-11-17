# Singularity Part 4: Advanced Usage 

## example.py
```
import sys

print(sys.version)

try:
    import pandas
    print("I have pandas")
except ImportError:
    print("I do not have pandas")
```

## Add custom module files to path
```
module use ./modules
module load grep/3.6
module load python3/3.8.8
```
