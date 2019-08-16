FROM ubuntu:18.04

RUN apt-get update && apt-get install -y zlib1g-dev libbz2-dev liblzma-dev libkrb5-3 python-pip gdebi wget

RUN pip install cython numpy scipy 
RUN pip install RGT==0.12.1

RUN wget http://se.archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
RUN gdebi libpng12-0_1.2.54-1ubuntu1_amd64.deb

WORKDIR "/root/rgtdata/"

RUN rm data.config.user 

RUN echo $'[mm9]\n\
genome: /nfs/med-bfx-common/rgt-data/mm9/genome_mm9.fa\n\
chromosome_sizes: /nfs/med-bfx-common/rgt-data/mm9/chrom.sizes.mm9\n\
genes_Gencode: /nfs/med-bfx-common/rgt-data/mm9/genes_Gencode_mm9.bed\n\
genes_RefSeq: /nfs/med-bfx-common/rgt-data/mm9/genes_RefSeq_mm9.bed\n\
annotation: /nfs/med-bfx-common/rgt-data/mm9/gencode.vM1.annotation.gtf\n\
gene_alias: /nfs/med-bfx-common/rgt-data/mm9/alias_mouse.txt\n\
\n\
repeat_maskers: /nfs/med-bfx-common/rgt-data/mm9/repeat_maskers\n\
\n\
[mm10]\n\
genome: /nfs/med-bfx-common/rgt-data/mm10/genome_mm10.fa\n\
chromosome_sizes: /nfs/med-bfx-common/rgt-data/mm10/chrom.sizes.mm10\n\
genes_Gencode: /nfs/med-bfx-common/rgt-data/mm10/genes_Gencode_mm10.bed\n\
genes_RefSeq: /nfs/med-bfx-common/rgt-data/mm10/genes_RefSeq_mm10.bed\n\
annotation: /nfs/med-bfx-common/rgt-data/mm10/gencode.vM20.annotation.gtf\n\
gene_alias: /nfs/med-bfx-common/rgt-data/mm10/alias_mouse.txt\n\
\n\
[hg19]\n\
genome: /nfs/med-bfx-common/rgt-data/hg19/genome_hg19.fa\n\
chromosome_sizes: /nfs/med-bfx-common/rgt-data/hg19/chrom.sizes.hg19\n\
genes_Gencode: /nfs/med-bfx-common/rgt-data/hg19/genes_Gencode_hg19.bed\n\
genes_RefSeq: /nfs/med-bfx-common/rgt-data/hg19/genes_RefSeq_hg19.bed\n\
annotation: /nfs/med-bfx-common/rgt-data/hg19/gencode.v19.annotation.gtf\n\
gene_alias: /nfs/med-bfx-common/rgt-data/hg19/alias_human.txt\n\
\n\
repeat_maskers: /nfs/med-bfx-common/rgt-data/hg19/repeat_maskers\n\
\n\
[hg38]\n\
genome: /nfs/med-bfx-common/rgt-data/hg38/genome_hg38.fa\n\
chromosome_sizes: /nfs/med-bfx-common/rgt-data/hg38/chrom.sizes.hg38\n\
genes_Gencode: /nfs/med-bfx-common/rgt-data/hg38/genes_Gencode_hg38.bed\n\
genes_RefSeq: /nfs/med-bfx-common/rgt-data/hg38/genes_RefSeq_hg38.bed\n\
annotation: /nfs/med-bfx-common/rgt-data/hg38/gencode.v24.annotation.gtf\n\
gene_alias: /nfs/med-bfx-common/rgt-data/hg38/alias_human.txt\n\
\n\
repeat_maskers: /nfs/med-bfx-common/rgt-data/hg38/repeat_maskers\n\
\n\
[zv9]\n\
genome: /nfs/med-bfx-common/rgt-data/zv9/genome_zv9_ensembl_release_79.fa\n\
chromosome_sizes: /nfs/med-bfx-common/rgt-data/zv9/chrom.sizes.zv9\n\
gene_regions: /nfs/med-bfx-common/rgt-data/zv9/genes_zv9.bed\n\
annotation: /nfs/med-bfx-common/rgt-data/zv9/Danio_rerio.Zv9.79.gtf\n\
gene_alias: /nfs/med-bfx-common/rgt-data/zv9/alias_zebrafish.txt\n\
\n\
[zv10]\n\
genome: /nfs/med-bfx-common/rgt-data/zv10/genome_zv10_ensembl_release_84.fa\n\
chromosome_sizes: /nfs/med-bfx-common/rgt-data/zv10/chrom.sizes.zv10\n\
gene_regions: /nfs/med-bfx-common/rgt-data/zv10/genes_zv10.bed\n\
annotation: /nfs/med-bfx-common/rgt-data/zv10/Danio_rerio.GRCz10.84.gtf\n\
gene_alias: /nfs/med-bfx-common/rgt-data/zv10/alias_zebrafish.txt\n\
\n\
[MotifData]\n\
pwm_dataset: /nfs/med-bfx-common/rgt-data/motifs\n\
repositories: /nfs/med-bfx-common/rgt-data/jaspar_vertebrates\n\
\n\
[HmmData]\n\
default_hmm_dnase: /nfs/med-bfx-common/rgt-data/fp_hmms/dnase.hmm\n\
default_hmm_dnase_bc: /nfs/med-bfx-common/rgt-data/fp_hmms/dnase_bc.hmm\n\
default_hmm_atac_paired: /nfs/med-bfx-common/rgt-data/fp_hmms/atac_paired.pkl\n\
default_hmm_atac_single: /nfs/med-bfx-common/rgt-data/fp_hmms/atac_single.pkl\n\
default_hmm_histone: /nfs/med-bfx-common/rgt-data/fp_hmms/histone.hmm\n\
default_hmm_dnase_histone: /nfs/med-bfx-common/rgt-data/fp_hmms/dnase_histone.hmm\n\
default_hmm_dnase_histone_bc: /nfs/med-bfx-common/rgt-data/fp_hmms/dnase_histone_bc.hmm\n\
default_hmm_atac_histone: /nfs/med-bfx-common/rgt-data/fp_hmms/atac_histone.hmm\n\
default_hmm_atac_histone_bc: /nfs/med-bfx-common/rgt-data/fp_hmms/atac_histone_bc.hmm\n\
default_bias_table_F_SH: /nfs/med-bfx-common/rgt-data/fp_hmms/single_hit_bias_table_F.txt\n\
default_bias_table_R_SH: /nfs/med-bfx-common/rgt-data/fp_hmms/single_hit_bias_table_R.txt\n\
default_bias_table_F_DH: /nfs/med-bfx-common/rgt-data/fp_hmms/double_hit_bias_table_F.txt\n\
default_bias_table_R_DH: /nfs/med-bfx-common/rgt-data/fp_hmms/double_hit_bias_table_R.txt\n\
default_bias_table_F_ATAC: /nfs/med-bfx-common/rgt-data/fp_hmms/atac_bias_table_F.txt\n\
default_bias_table_R_ATAC: /nfs/med-bfx-common/rgt-data/fp_hmms/atac_bias_table_R.txt\n\
dependency_model: /nfs/med-bfx-common/rgt-data/fp_hmms/LearnDependencyModel.jar\n\
slim_dimont_predictor: /nfs/med-bfx-common/rgt-data/fp_hmms/SlimDimontPredictor.jar\n\
default_test_fa: /nfs/med-bfx-common/rgt-data/fp_hmms/test.fa\' > data.config.user
