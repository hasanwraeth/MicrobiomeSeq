qiime diversity alpha-group-significance \
  --i-alpha-diversity diversity-core-metrics-phylogenetic/observed_features_vector.qza \
  --m-metadata-file sample-metadata.tsv \
  --o-visualization alpha-group-sig-obs-feats.qzv

qiime longitudinal linear-mixed-effects \
  --m-metadata-file sample-metadata.tsv diversity-core-metrics-phylogenetic/observed_features_vector.qza \
  --p-state-column DayRelativeToNearestHCT \
  --p-individual-id-column PatientID \
  --p-metric observed_features \
  --o-visualization lme-obs-features-HCT.qzv

qiime longitudinal linear-mixed-effects \
  --m-metadata-file sample-metadata.tsv diversity-core-metrics-phylogenetic/observed_features_vector.qza \
  --p-state-column day-relative-to-fmt \
  --p-individual-id-column PatientID \
  --p-metric observed_features \
  --o-visualization lme-obs-features-FMT.qzv

qiime longitudinal linear-mixed-effects \
  --m-metadata-file sample-metadata.tsv diversity-core-metrics-phylogenetic/observed_features_vector.qza \
  --p-state-column day-relative-to-fmt \
  --p-group-columns autoFmtGroup \
  --p-individual-id-column PatientID \
  --p-metric observed_features \
  --o-visualization lme-obs-features-treatmentVScontrol.qzv