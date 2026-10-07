set -eu
for file in *.txt; do
  test -f "$file" || { echo "No topic files found"; exit 1; }
  echo "Checking $file"
  grep -Eq '^Name:[[:space:]]*[^[:space:]]' "$file" || {
    echo "Missing Name: in $file"
    exit 1
  }
done
echo "All topic checks passed"