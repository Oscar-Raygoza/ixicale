import os

print("{")
for value in list(os.environ):
    print('\t"envi[{}]": "{}",'.format(value, os.environ[value]))
print("}")

if "VIRTUAL_ENV" in list(os.environ):
    print("\n\n.venv is activated")
else:
    print("\n\n.venv is NOT activated")
