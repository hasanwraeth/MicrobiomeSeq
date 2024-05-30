wget \
  -O 'gg-13-8-99-nb-classifier.qza' \
  'https://docs.qiime2.org/jupyterbooks/cancer-microbiome-intervention-tutorial/data/030-tutorial-downstream/020-taxonomy/gg-13-8-99-nb-classifier.qza'

qiime feature-classifier classify-sklearn \
  --i-classifier gg-13-8-99-nb-classifier.qza \
  --i-reads filtered-sequences-1.qza \
  --o-classification taxonomy.qza

qiime metadata tabulate \
  --m-input-file taxonomy.qza \
  --o-visualization taxonomy.qzv

qiime taxa filter-table \
  --i-table filtered-table-2.qza \
  --i-taxonomy taxonomy.qza \
  --p-mode contains \
  --p-include p__ \
  --p-exclude 'p__;,Chloroplast,Mitochondria' \
  --o-filtered-table filtered-table-3.qza

qiime feature-table filter-samples \
  --i-table filtered-table-3.qza \
  --p-min-frequency 10000 \
  --o-filtered-table filtered-table-4.qza

qiime feature-table filter-seqs \
  --i-data rep-seqs.qza \
  --i-table filtered-table-4.qza \
  --o-filtered-data filtered-sequences-2.qza

qiime taxa barplot \
  --i-table filtered-table-4.qza \
  --i-taxonomy taxonomy.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization taxa-bar-plots-1.qzv