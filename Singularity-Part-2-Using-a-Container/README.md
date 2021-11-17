# Singularity Part 2: Using a Container 

## pandas_example.py
```
import sys

print(sys.version)

try:
    import pandas
    print("I have pandas")
except ImportError:
    print("I do not have pandas")
```

## Use singularity exec
```
module load singularity
singularity pull docker://continuumio/anaconda3
singularity exec -B /projects:/projects anaconda3_latest.sif python3 pandas_example.py
```
