# Load File Modification & QC Validation (eDiscovery Simulation)
### Multi-stream load processing, privilege-safe production export, and Bates verification aligned to LAW / Relativity workflows

## Overview
This project simulates an eDiscovery Data Specialist workflow focused on modifying load files, validating data integrity at scale, and generating a production-ready export. It demonstrates repeatable QC checks, privilege exclusion controls, and sequential Bates numbering—core responsibilities for government and regulated eDiscovery environments.

## What This Demonstrates
- Load file modification and standardization (delimiters, mappings, date formats)
- Multi-stream ingestion and reconciliation (before/after record counts)
- QC validation (required fields, duplicates, file type checks)
- Privilege-safe production export (zero privileged records exported)
- Bates numbering with uniqueness verification


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
