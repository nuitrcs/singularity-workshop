# Singularity Part 3: The Container Recipe or Definition File
## Sign into the Sylabs remote builder
```
module load singularity
singularity remote login
```

## Build containers from defintion files
```
singularity build --remote python_with_pandas.sif python_with_pandas.def
singularity build --remote hello_world.sif compile_c.def
```
