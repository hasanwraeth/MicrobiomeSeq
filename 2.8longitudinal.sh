qiime taxa collapse \
  --i-table filtered-table-4.qza \
  --i-taxonomy taxonomy.qza \
  --p-level 6 \
  --o-collapsed-table genus-table.qza

qiime feature-table filter-features-conditionally \
  --i-table genus-table.qza \
  --p-prevalence 0.1 \
  --p-abundance 0.01 \
  --o-filtered-table filtered-genus-table.qza

qiime feature-table relative-frequency \
  --i-table filtered-genus-table.qza \
  --o-relative-frequency-table genus-rf-table.qza

qiime longitudinal volatility \
  --i-table genus-rf-table.qza \
  --p-state-column week-relative-to-hct \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-individual-id-column PatientID \
  --p-default-group-column autoFmtGroup \
  --o-visualization volatility-plot-1.qzv

qiime longitudinal volatility \
  --i-table genus-rf-table.qza \
  --p-state-column week-relative-to-fmt \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-individual-id-column PatientID \
  --p-default-group-column autoFmtGroup \
  --o-visualization volatility-plot-2.qzv

qiime longitudinal feature-volatility \
  --i-table filtered-genus-table.qza \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-state-column week-relative-to-hct \
  --p-individual-id-column PatientID \
  --output-dir longitudinal-feature-volatility

qiime longitudinal feature-volatility \
  --i-table filtered-genus-table.qza \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-state-column week-relative-to-fmt \
  --p-individual-id-column PatientID \
  --output-dir longitudinal-feature-volatility-2