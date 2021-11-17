import sys
print("Python version: {0}".format(sys.version))

try:
    import pandas
    print("I imported pandas...")
except ImportError:
    print("No Pandas Installed")
