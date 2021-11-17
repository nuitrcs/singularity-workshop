import sys

print(sys.version)

try:
    import pandas
    print("I have pandas")
except ImportError:
    print("I do not have pandas")
