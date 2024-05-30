qiime diversity core-metrics-phylogenetic \
  --i-phylogeny phylogeny-align-to-tree-mafft-fasttree/rooted_tree.qza \
  --i-table filtered-table-4.qza \
  --p-sampling-depth 10000 \
  --m-metadata-file sample-metadata.tsv \
  --output-dir diversity