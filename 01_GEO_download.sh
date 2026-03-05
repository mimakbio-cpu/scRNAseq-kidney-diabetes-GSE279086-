#!/bin/bash

# Base URL for GEO sample supplemental files
BASE_URL="https://ftp.ncbi.nlm.nih.gov/geo/samples"

# Files to download per GSM
FILES=(
    "barcodes.tsv.gz"
    "features.tsv.gz"
    "matrix.mtx.gz"
)

# Output directory
BASE_DIR=~/GSE279086/raw_geo_data
mkdir -p "$BASE_DIR"
cd "$BASE_DIR" || exit 1

# List of GSM IDs (replace with actual GSMs from GSE279086)
samples=(
    "GSM123456"
    "GSM123457"
    "GSM123458"
)

# Loop over each GSM
for GSM in "${samples[@]}"; do
    SUBDIR="${GSM:0:7}nnn"   # e.g., GSM1234nnn
    DEST_DIR="${GSM}"        # Folder for each GSM
    mkdir -p "$DEST_DIR"

    echo "Downloading for $GSM..."
    for FILE in "${FILES[@]}"; do
        URL="${BASE_URL}/${SUBDIR}/${GSM}/suppl/${GSM}_${FILE}"
        echo "  → $FILE"
        wget -q -P "$DEST_DIR" "$URL" || echo "Failed to download $FILE for $GSM"
    done
    echo ""
done

echo "All downloads completed successfully!"
