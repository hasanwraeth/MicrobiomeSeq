qiime dada2 denoise-paired \
  --i-demultiplexed-seqs demultiplexed-sequences.qza \
  --p-trunc-len-f 204 \
  --p-trim-left-r 1 \
  --p-trunc-len-r 205 \
  --o-representative-sequences asv-sequences-0.qza \
  --o-table feature-table-0.qza \
  --o-denoising-stats dada2-stats.qza


qiime metadata tabulate \
  --m-input-file dada2-stats.qza \
  --o-visualization dada2-stats-summ.qzv
  

qiime feature-table summarize \
  --i-table feature-table-0.qza \
  --m-sample-metadata-file sample-metadata.tsv \
  --o-visualization feature-table-0-summ.qzv
qiime feature-table tabulate-seqs \
  --i-data asv-sequences-0.qza \
  --o-visualization asv-sequences-0-summ.qzv
