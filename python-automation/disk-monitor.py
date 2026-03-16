import shutil

total, used, free = shutil.disk_usage("/")

print("Disk Usage Information")

print(f"Total: {total // (2**30)} GB")
print(f"Used: {used // (2**30)} GB")
print(f"Free: {free // (2**30)} GB")

usage_percent = (used / total) * 100

if usage_percent > 80:
    print("WARNING: Disk usage above 80%")
else:
    print("Disk usage is normal")
