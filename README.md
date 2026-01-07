# Load File Modification & Multi-Stream Processing Validation (SQL Server / Excel)

## Overview
This project simulates an eDiscovery multi-stream intake scenario where incoming load files arrive in different formats (delimiters, column names, date formats). The objective is to modify/standardize load files and validate them for QC accuracy prior to downstream processing.

## What this demonstrates
- Load file modification (delimiter changes, column mapping, date normalization)
- Running multiple load streams simultaneously
- QC validation (record counts, required fields, invalid file types, deduplication)
- Documentation suitable for regulated / government workflows

## Inputs and Outputs
### Original vendor files (different formats)
- `data/vendor_A_original.csv` (comma, MM/DD/YYYY)
- `data/vendor_B_original.csv` (pipe, YYYY-MM-DD)
- `data/vendor_C_original.tsv` (tab, DD-MMM-YYYY)

### Standardized load files (delivery-ready)
- `data/standardized_load_A.csv`
- `data/standardized_load_B.csv`
- `data/standardized_load_C.csv`

## How to run (SSMS)
1. Create staging table:
   - `sql/create_staging_table.sql`
2. Load standardized files (choose one approach):
   - `sql/load_streams.sql` (Import Wizard or BULK INSERT guidance)
3. Run QC validation queries:
   - `sql/validation_queries.sql`
4. Document results:
   - `docs/Load_File_QC_Summary.md`

## Key QC checks (SQL)
- Record count reconciliation per stream
- Required field validation (DocID, Custodian, FileType, DateCreated, MD5Hash)
- Invalid file type detection
- Duplicate detection across streams (MD5Hash)
- Field pattern checks (non-hex hashes)

## Notes
Counts vary per run because the dataset includes intentionally injected issues (missing values, invalid file types, and duplicate hashes) to demonstrate remediation and QC workflows.
