wget \
  -O 'feature-table.qza' \
  'https://docs.qiime2.org/jupyterbooks/cancer-microbiome-intervention-tutorial/data/030-tutorial-downstream/010-filtering/feature-table.qza'

wget \
  -O 'rep-seqs.qza' \
  'https://docs.qiime2.org/jupyterbooks/cancer-microbiome-intervention-tutorial/data/030-tutorial-downstream/010-filtering/rep-seqs.qza'

qiime feature-table summarize \
  --i-table feature-table.qza \
  --m-sample-metadata-file sample-metadata.tsv \
  --o-visualization table.qzv
qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization rep-seqs.qzv

qiime feature-table filter-samples \
  --i-table feature-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --p-where 'autoFmtGroup IS NOT NULL' \
  --o-filtered-table autofmt-table.qza

qiime feature-table summarize \
  --i-table autofmt-table.qza \
  --m-sample-metadata-file sample-metadata.tsv \
  --o-visualization autofmt-table-summ.qzv

qiime feature-table filter-samples \
  --i-table autofmt-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --p-where 'DayRelativeToNearestHCT BETWEEN -10 AND 70' \
  --o-filtered-table filtered-table-1.qza

qiime feature-table filter-seqs \
  --i-data rep-seqs.qza \
  --i-table filtered-table-2.qza \
  --o-filtered-data filtered-sequences-1.qza

