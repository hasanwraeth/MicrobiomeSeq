qiime sample-classifier classify-samples \
  --i-table ./dada2_table.qza \
  --m-metadata-file ./metadata.tsv \
  --m-metadata-column genotype_and_donor_status \
  --p-random-state 666 \
  --p-n-jobs 1 \
  --output-dir ./sample-classifier-results/

qiime sample-classifier heatmap \
  --i-table ./dada2_table.qza \
  --i-importance ./sample-classifier-results/feature_importance.qza \
  --m-sample-metadata-file ./metadata.tsv \
  --m-sample-metadata-column genotype_and_donor_status \
  --p-group-samples \
  --p-feature-count 100 \
  --o-heatmap ./sample-classifier-results/heatmap_100-features.qzv \
  --o-filtered-table ./sample-classifier-results/filtered-table_100-features.qza