# Load File QC Summary (Multi-Stream Validation)

## Purpose
This report summarizes QC validation results after standardizing and loading multiple incoming load files (Vendor A, Vendor B, Vendor C) into SQL Server staging.

## What was standardized (Excel)
- Delimiters normalized to comma-separated CSV
- Column names mapped to a standard schema: `DocID, Custodian, FileType, DateCreated, MD5Hash, SourceFile`
- Date formats normalized to ISO (`YYYY-MM-DD`)

## QC checks performed (SQL)
- Record count reconciliation per stream
- Required-field validation (null/blank critical fields)
- File type validation against an approved list
- Hash-based duplicate detection across streams
- Field pattern checks (e.g., non-hex hashes)

## Results (fill after running validation_queries.sql)
- Record counts per stream:
  - Vendor_A: ___
  - Vendor_B: ___
  - Vendor_C: ___

- Missing required fields:
  - Vendor_A: ___
  - Vendor_B: ___
  - Vendor_C: ___

- Invalid file types detected:
  - Vendor_A: ___
  - Vendor_B: ___
  - Vendor_C: ___

- Duplicate hashes (cross-stream):
  - Total duplicates: ___
  - Top duplicate hash counts: ___

## Final disposition
- Vendor_A: Pass / Fail (notes: ___)
- Vendor_B: Pass / Fail (notes: ___)
- Vendor_C: Pass / Fail (notes: ___)
