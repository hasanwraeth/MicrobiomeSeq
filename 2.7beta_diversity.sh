qiime diversity umap \
  --i-distance-matrix diversity-core-metrics-phylogenetic/unweighted_unifrac_distance_matrix.qza \
  --o-umap uu-umap.qza
qiime diversity umap \
  --i-distance-matrix diversity-core-metrics-phylogenetic/weighted_unifrac_distance_matrix.qza \
  --o-umap wu-umap.qza

qiime metadata tabulate \
  --m-input-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --o-visualization expanded-metadata-summ.qzv

qiime taxa barplot \
  --i-table filtered-table-4.qza \
  --i-taxonomy taxonomy.qza \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --o-visualization taxa-bar-plots-2.qzv

qiime emperor plot \
  --i-pcoa uu-umap.qza \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-custom-axes week-relative-to-hct \
  --o-visualization uu-umap-emperor-w-time.qzv
qiime emperor plot \
  --i-pcoa wu-umap.qza \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-custom-axes week-relative-to-hct \
  --o-visualization wu-umap-emperor-w-time.qzv
qiime emperor plot \
  --i-pcoa diversity-core-metrics-phylogenetic/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-custom-axes week-relative-to-hct \
  --o-visualization uu-pcoa-emperor-w-time.qzv
qiime emperor plot \
  --i-pcoa diversity-core-metrics-phylogenetic/weighted_unifrac_pcoa_results.qza \
  --m-metadata-file sample-metadata.tsv uu-umap.qza diversity-core-metrics-phylogenetic/faith_pd_vector.qza diversity-core-metrics-phylogenetic/evenness_vector.qza diversity-core-metrics-phylogenetic/shannon_vector.qza \
  --p-custom-axes week-relative-to-hct \
  --o-visualization wu-pcoa-emperor-w-time.qzv