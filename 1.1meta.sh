#Download data
wget \
  -O 'sample-metadata.tsv' \
  'https://docs.qiime2.org/jupyterbooks/cancer-microbiome-intervention-tutorial/data/020-tutorial-upstream/020-metadata/sample-metadata.tsv'

qiime metadata tabulate \
  --m-input-file sample-metadata.tsv \
  --o-visualization metadata-summ-1.qzv

