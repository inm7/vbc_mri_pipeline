#!/bin/bash
grp=${1}
sbj=${2}

fp=/mnt_fp # /p/project/cjinm71/SC_Pipe_jung3/Neuroimage/Tools/freesurfer/subjects
ap=/mnt_ap # /p/project/cjinm71/SC_Pipe_jung3/Neuroimage/Atlas
tp=/mnt_tp # /p/scratch/cjinm71/jung3/03_Structural_Connectivity

LUT=${ap}/HarvardOxford_96Parcels_LUT.txt

# Call container_SC_dependencies
# ------------------------------
source /usr/local/bin/container_SC_dependencies.sh
export SUBJECTS_DIR=/opt/freesurfer/subjects

# Colors
# ------
RED='\033[1;31m'	# Red
GRN='\033[1;32m' 	# Green
NCR='\033[0m' 		# No Color

mris_ca_train -sdir ${fp} -t ${LUT} -n 351 lh lh.sphere.reg HarvardOxford_96Parcels HCP_101309 HCP_102311 HCP_103111 HCP_108525 HCP_110411 HCP_111009 HCP_111413 HCP_112920 HCP_126628 HCP_131217 lh.HarvardOxford_96Parcels.gcs
mris_ca_train -sdir ${fp} -t ${LUT} -n 351 rh rh.sphere.reg HarvardOxford_96Parcels HCP_101309 HCP_102311 HCP_103111 HCP_108525 HCP_110411 HCP_111009 HCP_111413 HCP_112920 HCP_126628 HCP_131217 rh.HarvardOxford_96Parcels.gcs
mv ${FS}/lh.HarvardOxford_96Parcels.gcs /Users/kyesamjung/Projects/Neuroimage/Tools/freesurfer/classifiers/lh.HarvardOxford_96Parcels.gcs
mv ${FS}/rh.HarvardOxford_96Parcels.gcs /Users/kyesamjung/Projects/Neuroimage/Tools/freesurfer/classifiers/rh.HarvardOxford_96Parcels.gcs
printf "${GRN}[Freesurfer]${RED} ID: ${grp}${sbj}${NCR} - Annotation files: lh.HarvardOxford_96Parcels.annot and rh.HarvardOxford_96Parcels.annot have been saved.\n"
