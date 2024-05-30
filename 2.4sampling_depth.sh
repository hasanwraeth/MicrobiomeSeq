qiime feature-table summarize \
  --i-table filtered-table-4.qza \
  --m-sample-metadata-file sample-metadata.tsv \
  --o-visualization filtered-table-4-summ.qzv

qiime diversity alpha-rarefaction \
  --i-table filtered-table-4.qza \
  --p-metrics shannon \
  --m-metadata-file sample-metadata.tsv \
  --p-max-depth 33000 \
  --o-visualization shannon-rarefaction-plot.qzv

qiime diversity beta-rarefaction \
  --i-table filtered-table-4.qza \
  --p-metric braycurtis \
  --p-clustering-method nj \
  --p-sampling-depth 10000 \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization braycurtis-rarefaction-plot.qzv