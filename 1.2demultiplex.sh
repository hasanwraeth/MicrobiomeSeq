#Download data
wget \
  -O 'data_to_import.zip' \
  'https://docs.qiime2.org/jupyterbooks/cancer-microbiome-intervention-tutorial/data/020-tutorial-upstream/030-importing/data_to_import.zip'

unzip -d data_to_import data_to_import.zip

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-format CasavaOneEightSingleLanePerSampleDirFmt \
  --input-path data_to_import \
  --output-path demultiplexed-sequences.qza

qiime demux summarize \
  --i-data demultiplexed-sequences.qza \
  --o-visualization demultiplexed-sequences-summ.qzv