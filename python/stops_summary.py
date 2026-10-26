import csv
import json
import os
import sys



STOPS_PATH = "data/raw/gtfs/stops.txt"

try:
    with open(STOPS_PATH, encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        stop_names = [row["stop_name"] for row in reader]
    
except FileNotFoundError:
    print(f"Could not find {STOPS_PATH}. Are you running this from the de-journey folder?")
    sys.exit(1)

print(len(stop_names))
print(stop_names[:5])

clean_names = [name.strip() for name in stop_names if name.strip()]

summary = {
    "total_stops": len(clean_names),
    "sample_stops": clean_names[:5]
}

os.makedirs("data/processed", exist_ok=True)

with open("data/processed/summary.json", "w", encoding="utf-8") as f:
    json.dump(summary, f, indent=2)
