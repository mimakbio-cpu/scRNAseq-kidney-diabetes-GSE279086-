📊 Single‑Cell RNA‑seq Analysis of GSE279086

Author: Abdul Kader Ibrahim
Date: 2026‑03‑05

🚀 Pipeline Status
01_GEO_download ✅ | 02_GEO_cleanup ✅ | 03_10XtoSeurat ✅ | 04_combine_seurat ✅ | 05_qc_PCA_batchcorrection ✅ | 06_celltypist 🔜 | 07_DEGs 🔜 | 08_Pathways 🔜

✅ = completed🔜 = upcoming

📌 Overview:

This repository presents a reproducible workflow for analyzing the single‑cell RNA‑seq dataset GSE279086, focused on kidney biology in Type 1 Diabetes. The pipeline is modular, step‑wise, and designed for clarity, reproducibility, and professional presentation. Each stage is documented with both technical detail and biological context, so the repo serves as both a workflow and a scientific narrative.

🔄 Analysis Workflow (Pipeline Diagram):

Raw GEO Data (GSE279086)
        │
        ▼
01_GEO_download.sh
   → Download GEO files
        │
        ▼
02_GEO_cleanup.sh
   → Clean & standardize inputs
        │
        ▼
03_10XtoSeurat.Rmd
   → Create Seurat objects per sample
        │
        ▼
04_combine_seurat.Rmd
   → Merge 40 Seurat objects
        │
        ▼
05_qc_PCA_batchcorrection.Rmd
   → QC filtering, PCA/UMAP, Harmony batch correction
        │
        ▼
06_celltypist_GSE279086.ipynb
   → Cell type annotation & composition
        │
        ▼
07_DEGs_GSE279086.Rmd
   → Differential expression analysis
        │
        ▼
08_Pathways_GSE279086.Rmd
   → Pathway enrichment (Reactome, KEGG, GSEA)
        │
        ▼
Final Outputs
   ├── QC tables
   ├── Seurat objects (.rds, .h5seurat, .h5ad)
   ├── Plots (QC, UMAP, Harmony, Cell types, DEGs, Pathways)
   └── Reports (DEG summary, pathway enrichment PDFs)

⚙️ Workflow Scripts:

01_GEO_download.sh

Automates retrieval of raw GEO matrices. Each GSM accession is mapped to sample IDs, ensuring reproducibility and a clean foundation for downstream analysis.

02_GEO_cleanup.sh

Standardizes GEO folders to 10x Genomics format and removes pre‑processed files. This ensures compatibility with Seurat/Scanpy and keeps the workflow strictly raw‑data driven.

03_10XtoSeurat.Rmd

Converts raw matrices into Seurat objects. Minimal filtering removes empty droplets and low‑quality cells. Metadata (sample IDs, condition labels) is preserved for disease‑aware comparisons. QC metrics such as mitochondrial and ribosomal content are computed to guide downstream filtering.

04_combine_seurat.Rmd

Merges 40 Seurat objects into one dataset. Metadata harmonization ensures consistency across samples. Exploratory plots (cell counts, QC violin plots) provide an overview of dataset integrity before deeper QC.

05_qc_PCA_batchcorrection.Rmd

Applies multi‑layered QC:

Gene counts to remove empty droplets and doublets.

Mitochondrial/ribosomal fractions to filter stressed or low‑information cells.

Mahalanobis distance to detect subtle outliers.

The dataset is normalized, variable features selected, PCA performed, and UMAP embeddings generated. Harmony batch correction reduces technical noise, producing biologically coherent clusters. Outputs include QC tables, corrected Seurat objects, and UMAP coordinates.

06_celltypist_GSE279086.ipynb (upcoming)

Cell types will be annotated using CellTypist. UMAPs will be generated per condition to compare Control vs T1D kidneys. Composition analysis will highlight shifts in tubular, endothelial, and immune compartments.

07_DEGs_GSE279086.Rmd (upcoming)

Differential expression analysis (MAST) will identify transcriptional changes within specific cell types. This will reveal which populations are most responsive to diabetic stress. Outputs will include DEG tables, volcano plots, and heatmaps.

08_Pathways_GSE279086.Rmd (upcoming)

Pathway enrichment (Reactome GSEA, KEGG) will connect DEGs to biological processes. Early diabetic kidney disease is expected to show metabolic and vascular pathway remodeling rather than wholesale cell loss.

📊 Results & Interpretation

QC + PCA + Batch Correction: Harmony integration successfully reduced batch effects, producing coherent clusters across samples.

Cell Typing (planned): Anticipated remodeling of endothelial and tubular compartments, with possible reduction in podocytes.

DEGs (planned): Expected transcriptional shifts in principal cells and vascular endothelial subtypes, highlighting cell‑type‑specific responses.

Pathways (planned): Likely enrichment in oxidative metabolism and vascular signaling pathways, consistent with early diabetic kidney stress.

