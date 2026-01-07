# Load File Modification & QC Validation (eDiscovery Simulation)
### Multi-stream load processing, privilege-safe production export, and Bates verification aligned to LAW / Relativity workflows

## Overview
This project simulates an **eDiscovery Data Specialist** workflow focused on modifying load files, validating data integrity at scale, and generating a **production-ready export**. It demonstrates repeatable quality control (QC) checks, privilege exclusion controls, and sequential Bates numbering—core responsibilities in **government and regulated eDiscovery environments**.

---

## What This Demonstrates
- Load file modification and standardization (delimiters, column mappings, date formats)
- Multi-stream ingestion with reconciliation (before/after record counts)
- QC validation under volume:
  - Required field checks
  - Duplicate detection
  - File type validation
- Privilege-safe production export (**zero privileged records exported**)
- Sequential Bates numbering with uniqueness verification

---

## Inputs and Outputs

### Original Vendor Files (Different Formats)
- `data/vendor_A_original.csv` — comma-delimited, `MM/DD/YYYY`
- `data/vendor_B_original.csv` — pipe-delimited, `YYYY-MM-DD`
- `data/vendor_C_original.tsv` — tab-delimited, `DD-MMM-YYYY`

### Standardized Load Files (Delivery-Ready)
- `data/standardized_load_A.csv`
- `data/standardized_load_B.csv`
- `data/standardized_load_C.csv`

---

## How to Run (SQL Server / SSMS)

### 1. Create staging table


