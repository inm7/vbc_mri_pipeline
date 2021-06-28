#!/bin/bash
fp=/mnt_fp # /p/project/cjinm71/SC_Pipe_jung3/Neuroimage/Tools/freesurfer/subjects
ap=/mnt_ap # /p/project/cjinm71/SC_Pipe_jung3/Neuroimage/Atlas
tp=/mnt_tp # /p/scratch/cjinm71/jung3/03_Structural_Connectivity

atl=HarvardOxford_96Parcels
LUT=${ap}/${atl}_LUT.txt

# Call container_SC_dependencies
# ------------------------------
source /usr/local/bin/container_SC_dependencies.sh
export SUBJECTS_DIR=/opt/freesurfer/subjects

# Colors
# ------
RED='\033[1;31m'	# Red
GRN='\033[1;32m' 	# Green
NCR='\033[0m' 		# No Color

export SUBJECTS_DIR=${fp}
cp -r /opt/freesurfer/subjects/cvs_avg35 ${ap}/
for sbj_id in HCP_101309 HCP_102008 HCP_102311 HCP_102513 HCP_103111 HCP_103212 HCP_103515 HCP_104012 HCP_105115 HCP_106319 HCP_106521 HCP_107321 HCP_107725 HCP_108222 HCP_108525 HCP_110411 HCP_110613 HCP_111413 HCP_112920 HCP_113215 HCP_113316 HCP_113619 HCP_114217 HCP_114419 HCP_116524 HCP_117021 HCP_118023 HCP_118528 HCP_118730 HCP_118932 HCP_119025 HCP_119126 HCP_120414 HCP_121618 HCP_121921 HCP_123925 HCP_124422 HCP_124624 HCP_125222 HCP_126628 HCP_127933 HCP_128632 HCP_129028 HCP_130013 HCP_130316 HCP_130720 HCP_131217 HCP_131419 HCP_131823 HCP_132017 HCP_132118 HCP_133019 HCP_133827 HCP_134324 HCP_134627 HCP_135225 HCP_136126 HCP_136833 HCP_137027 HCP_137229 HCP_137532 HCP_137633 HCP_137936 HCP_138231 HCP_139233 HCP_139435 HCP_139839 HCP_140117 HCP_140319 HCP_141119 HCP_141422 HCP_141826 HCP_142828 HCP_143426 HCP_144226 HCP_144832 HCP_144933 HCP_146129 HCP_146331 HCP_146432 HCP_146533 HCP_146836 HCP_146937 HCP_147636 HCP_148032 HCP_148436 HCP_148941 HCP_150625 HCP_150928 HCP_151223 HCP_151526 HCP_152427 HCP_152831 HCP_153025 HCP_153126 HCP_153833 HCP_153934 HCP_154431 HCP_154532 HCP_155635 HCP_156031 HCP_157942 HCP_158136 HCP_159239 HCP_159441 HCP_160123 HCP_160729 HCP_160830 HCP_161731 HCP_161832 HCP_162329 HCP_162733 HCP_164030 HCP_164939 HCP_165840 HCP_167440 HCP_167743 HCP_168341 HCP_168745 HCP_168947 HCP_170631 HCP_171330 HCP_171532 HCP_173334 HCP_173435 HCP_173536 HCP_173839 HCP_175035 HCP_175237 HCP_176037 HCP_176239 HCP_177241 HCP_178142 HCP_178748 HCP_178849 HCP_178950 HCP_179346 HCP_180129 HCP_180230 HCP_180432 HCP_180836 HCP_180937 HCP_181232 HCP_182840 HCP_185846 HCP_186141 HCP_188145 HCP_188347 HCP_188549 HCP_189349 HCP_191235 HCP_192035 HCP_192136 HCP_193239 HCP_194645 HCP_194847 HCP_195445 HCP_195849 HCP_196750 HCP_199352 HCP_200917 HCP_201414 HCP_203418 HCP_204016 HCP_204319 HCP_204622 HCP_205725 HCP_206323 HCP_206525 HCP_206828 HCP_206929 HCP_207426 HCP_208226 HCP_208327 HCP_209127 HCP_209834 HCP_210112 HCP_210415 HCP_211215 HCP_211619 HCP_212015 HCP_212116 HCP_212419 HCP_213017 HCP_213421 HCP_213522 HCP_214221 HCP_214423 HCP_219231 HCP_220721 HCP_224022 HCP_227432 HCP_248339 HCP_255639 HCP_255740 HCP_256540 HCP_257542 HCP_257845 HCP_257946 HCP_268850 HCP_275645 HCP_281135 HCP_283543 HCP_286347 HCP_290136 HCP_298051 HCP_303119 HCP_304020 HCP_305830 HCP_308331 HCP_309636 HCP_311320 HCP_316633 HCP_325129 HCP_346945 HCP_348545 HCP_352738 HCP_371843 HCP_381543 HCP_382242 HCP_385450 HCP_397154 HCP_397861 HCP_414229 HCP_419239 HCP_421226 HCP_422632 HCP_424939 HCP_432332 HCP_433839 HCP_448347 HCP_465852 HCP_467351 HCP_468050 HCP_481042 HCP_486759 HCP_497865 HCP_499566 HCP_513130 HCP_519647 HCP_519950 HCP_530635 HCP_531536 HCP_531940 HCP_540436 HCP_541943 HCP_545345 HCP_552241 HCP_555651 HCP_555954 HCP_561444 HCP_567052 HCP_568963 HCP_571144 HCP_580347 HCP_580751 HCP_581349 HCP_583858 HCP_587664 HCP_590047 HCP_597869 HCP_599469 HCP_614439 HCP_615441 HCP_615744 HCP_622236 HCP_623844 HCP_627852 HCP_645450 HCP_647858 HCP_654350 HCP_656253 HCP_657659 HCP_660951 HCP_664757 HCP_668361 HCP_671855 HCP_673455 HCP_675661 HCP_677766 HCP_679568 HCP_680250 HCP_683256 HCP_685058 HCP_686969 HCP_687163 HCP_693764 HCP_695768 HCP_713239 HCP_715041 HCP_725751 HCP_727553 HCP_727654 HCP_729557 HCP_731140 HCP_735148 HCP_748258 HCP_748662 HCP_756055 HCP_763557 HCP_765056 HCP_771354 HCP_788674 HCP_788876 HCP_800941 HCP_802844 HCP_804646 HCP_812746 HCP_814548 HCP_816653 HCP_818455 HCP_820745 HCP_826454 HCP_833148 HCP_837560 HCP_841349 HCP_856766 HCP_856968 HCP_871762 HCP_872562 HCP_872764 HCP_873968 HCP_877269 HCP_878776 HCP_878877 HCP_885975 HCP_888678 HCP_889579 HCP_894067 HCP_901139 HCP_907656 HCP_911849 HCP_917255 HCP_919966 HCP_922854 HCP_926862 HCP_932554 HCP_937160 HCP_947668 HCP_951457 HCP_955465 HCP_957974 HCP_966975 HCP_978578 HCP_979984 HCP_983773 HCP_987983 HCP_992673 HCP_992774 HCP_993675 HCP_994273
do
    mri_surf2surf --srcsubject ${sbj_id} --trgsubject cvs_avg35 --hemi lh --sval-annot ${fp}/${sbj_id}/label/lh.${atl}.annot --tval ${ap}/cvs_avg35/lh.${atl}_${sbj_id}.annot
    mri_surf2surf --srcsubject ${sbj_id} --trgsubject cvs_avg35 --hemi rh --sval-annot ${fp}/${sbj_id}/label/rh.${atl}.annot --tval ${ap}/cvs_avg35/rh.${atl}_${sbj_id}.annot
done
export SUBJECTS_DIR=/opt/freesurfer/subjects
# mris_ca_train -sdir ${fp} -t ${LUT} -n 351 lh lh.sphere.reg HarvardOxford_96Parcels HCP_101309 HCP_102008 HCP_102311 HCP_102513 HCP_103111 HCP_103212 HCP_103515 HCP_104012 HCP_105115 HCP_106319 HCP_106521 HCP_107321 HCP_107725 HCP_108222 HCP_108525 HCP_110411 HCP_110613 HCP_111413 HCP_112920 HCP_113215 HCP_113316 HCP_113619 HCP_114217 HCP_114419 HCP_116524 HCP_117021 HCP_118023 HCP_118528 HCP_118730 HCP_118932 HCP_119025 HCP_119126 HCP_120414 HCP_121618 HCP_121921 HCP_123925 HCP_124422 HCP_124624 HCP_125222 HCP_126628 HCP_127933 HCP_128632 HCP_129028 HCP_130013 HCP_130316 HCP_130720 HCP_131217 HCP_131419 HCP_131823 HCP_132017 HCP_132118 HCP_133019 HCP_133827 HCP_134324 HCP_134627 HCP_135225 HCP_136126 HCP_136833 HCP_137027 HCP_137229 HCP_137532 HCP_137633 HCP_137936 HCP_138231 HCP_139233 HCP_139435 HCP_139839 HCP_140117 HCP_140319 HCP_141119 HCP_141422 HCP_141826 HCP_142828 HCP_143426 HCP_144226 HCP_144832 HCP_144933 HCP_146129 HCP_146331 HCP_146432 HCP_146533 HCP_146836 HCP_146937 HCP_147636 HCP_148032 HCP_148436 HCP_148941 HCP_150625 HCP_150928 HCP_151223 HCP_151526 HCP_152427 HCP_152831 HCP_153025 HCP_153126 HCP_153833 HCP_153934 HCP_154431 HCP_154532 HCP_155635 HCP_156031 HCP_157942 HCP_158136 HCP_159239 HCP_159441 HCP_160123 HCP_160729 HCP_160830 HCP_161731 HCP_161832 HCP_162329 HCP_162733 HCP_164030 HCP_164939 HCP_165840 HCP_167440 HCP_167743 HCP_168341 HCP_168745 HCP_168947 HCP_170631 HCP_171330 HCP_171532 HCP_173334 HCP_173435 HCP_173536 HCP_173839 HCP_175035 HCP_175237 HCP_176037 HCP_176239 HCP_177241 HCP_178142 HCP_178748 HCP_178849 HCP_178950 HCP_179346 HCP_180129 HCP_180230 HCP_180432 HCP_180836 HCP_180937 HCP_181232 HCP_182840 HCP_185846 HCP_186141 HCP_188145 HCP_188347 HCP_188549 HCP_189349 HCP_191235 HCP_192035 HCP_192136 HCP_193239 HCP_194645 HCP_194847 HCP_195445 HCP_195849 HCP_196750 HCP_199352 HCP_200917 HCP_201414 HCP_203418 HCP_204016 HCP_204319 HCP_204622 HCP_205725 HCP_206323 HCP_206525 HCP_206828 HCP_206929 HCP_207426 HCP_208226 HCP_208327 HCP_209127 HCP_209834 HCP_210112 HCP_210415 HCP_211215 HCP_211619 HCP_212015 HCP_212116 HCP_212419 HCP_213017 HCP_213421 HCP_213522 HCP_214221 HCP_214423 HCP_219231 HCP_220721 HCP_224022 HCP_227432 HCP_248339 HCP_255639 HCP_255740 HCP_256540 HCP_257542 HCP_257845 HCP_257946 HCP_268850 HCP_275645 HCP_281135 HCP_283543 HCP_286347 HCP_290136 HCP_298051 HCP_303119 HCP_304020 HCP_305830 HCP_308331 HCP_309636 HCP_311320 HCP_316633 HCP_325129 HCP_346945 HCP_348545 HCP_352738 HCP_371843 HCP_381543 HCP_382242 HCP_385450 HCP_397154 HCP_397861 HCP_414229 HCP_419239 HCP_421226 HCP_422632 HCP_424939 HCP_432332 HCP_433839 HCP_448347 HCP_465852 HCP_467351 HCP_468050 HCP_481042 HCP_486759 HCP_497865 HCP_499566 HCP_513130 HCP_519647 HCP_519950 HCP_530635 HCP_531536 HCP_531940 HCP_540436 HCP_541943 HCP_545345 HCP_552241 HCP_555651 HCP_555954 HCP_561444 HCP_567052 HCP_568963 HCP_571144 HCP_580347 HCP_580751 HCP_581349 HCP_583858 HCP_587664 HCP_590047 HCP_597869 HCP_599469 HCP_614439 HCP_615441 HCP_615744 HCP_622236 HCP_623844 HCP_627852 HCP_645450 HCP_647858 HCP_654350 HCP_656253 HCP_657659 HCP_660951 HCP_664757 HCP_668361 HCP_671855 HCP_673455 HCP_675661 HCP_677766 HCP_679568 HCP_680250 HCP_683256 HCP_685058 HCP_686969 HCP_687163 HCP_693764 HCP_695768 HCP_713239 HCP_715041 HCP_725751 HCP_727553 HCP_727654 HCP_729557 HCP_731140 HCP_735148 HCP_748258 HCP_748662 HCP_756055 HCP_763557 HCP_765056 HCP_771354 HCP_788674 HCP_788876 HCP_800941 HCP_802844 HCP_804646 HCP_812746 HCP_814548 HCP_816653 HCP_818455 HCP_820745 HCP_826454 HCP_833148 HCP_837560 HCP_841349 HCP_856766 HCP_856968 HCP_871762 HCP_872562 HCP_872764 HCP_873968 HCP_877269 HCP_878776 HCP_878877 HCP_885975 HCP_888678 HCP_889579 HCP_894067 HCP_901139 HCP_907656 HCP_911849 HCP_917255 HCP_919966 HCP_922854 HCP_926862 HCP_932554 HCP_937160 HCP_947668 HCP_951457 HCP_955465 HCP_957974 HCP_966975 HCP_978578 HCP_979984 HCP_983773 HCP_987983 HCP_992673 HCP_992774 HCP_993675 HCP_994273 ${fp}/lh.HarvardOxford_96Parcels.gcs
# mris_ca_train -sdir ${fp} -t ${LUT} -n 351 rh rh.sphere.reg HarvardOxford_96Parcels HCP_101309 HCP_102008 HCP_102311 HCP_102513 HCP_103111 HCP_103212 HCP_103515 HCP_104012 HCP_105115 HCP_106319 HCP_106521 HCP_107321 HCP_107725 HCP_108222 HCP_108525 HCP_110411 HCP_110613 HCP_111413 HCP_112920 HCP_113215 HCP_113316 HCP_113619 HCP_114217 HCP_114419 HCP_116524 HCP_117021 HCP_118023 HCP_118528 HCP_118730 HCP_118932 HCP_119025 HCP_119126 HCP_120414 HCP_121618 HCP_121921 HCP_123925 HCP_124422 HCP_124624 HCP_125222 HCP_126628 HCP_127933 HCP_128632 HCP_129028 HCP_130013 HCP_130316 HCP_130720 HCP_131217 HCP_131419 HCP_131823 HCP_132017 HCP_132118 HCP_133019 HCP_133827 HCP_134324 HCP_134627 HCP_135225 HCP_136126 HCP_136833 HCP_137027 HCP_137229 HCP_137532 HCP_137633 HCP_137936 HCP_138231 HCP_139233 HCP_139435 HCP_139839 HCP_140117 HCP_140319 HCP_141119 HCP_141422 HCP_141826 HCP_142828 HCP_143426 HCP_144226 HCP_144832 HCP_144933 HCP_146129 HCP_146331 HCP_146432 HCP_146533 HCP_146836 HCP_146937 HCP_147636 HCP_148032 HCP_148436 HCP_148941 HCP_150625 HCP_150928 HCP_151223 HCP_151526 HCP_152427 HCP_152831 HCP_153025 HCP_153126 HCP_153833 HCP_153934 HCP_154431 HCP_154532 HCP_155635 HCP_156031 HCP_157942 HCP_158136 HCP_159239 HCP_159441 HCP_160123 HCP_160729 HCP_160830 HCP_161731 HCP_161832 HCP_162329 HCP_162733 HCP_164030 HCP_164939 HCP_165840 HCP_167440 HCP_167743 HCP_168341 HCP_168745 HCP_168947 HCP_170631 HCP_171330 HCP_171532 HCP_173334 HCP_173435 HCP_173536 HCP_173839 HCP_175035 HCP_175237 HCP_176037 HCP_176239 HCP_177241 HCP_178142 HCP_178748 HCP_178849 HCP_178950 HCP_179346 HCP_180129 HCP_180230 HCP_180432 HCP_180836 HCP_180937 HCP_181232 HCP_182840 HCP_185846 HCP_186141 HCP_188145 HCP_188347 HCP_188549 HCP_189349 HCP_191235 HCP_192035 HCP_192136 HCP_193239 HCP_194645 HCP_194847 HCP_195445 HCP_195849 HCP_196750 HCP_199352 HCP_200917 HCP_201414 HCP_203418 HCP_204016 HCP_204319 HCP_204622 HCP_205725 HCP_206323 HCP_206525 HCP_206828 HCP_206929 HCP_207426 HCP_208226 HCP_208327 HCP_209127 HCP_209834 HCP_210112 HCP_210415 HCP_211215 HCP_211619 HCP_212015 HCP_212116 HCP_212419 HCP_213017 HCP_213421 HCP_213522 HCP_214221 HCP_214423 HCP_219231 HCP_220721 HCP_224022 HCP_227432 HCP_248339 HCP_255639 HCP_255740 HCP_256540 HCP_257542 HCP_257845 HCP_257946 HCP_268850 HCP_275645 HCP_281135 HCP_283543 HCP_286347 HCP_290136 HCP_298051 HCP_303119 HCP_304020 HCP_305830 HCP_308331 HCP_309636 HCP_311320 HCP_316633 HCP_325129 HCP_346945 HCP_348545 HCP_352738 HCP_371843 HCP_381543 HCP_382242 HCP_385450 HCP_397154 HCP_397861 HCP_414229 HCP_419239 HCP_421226 HCP_422632 HCP_424939 HCP_432332 HCP_433839 HCP_448347 HCP_465852 HCP_467351 HCP_468050 HCP_481042 HCP_486759 HCP_497865 HCP_499566 HCP_513130 HCP_519647 HCP_519950 HCP_530635 HCP_531536 HCP_531940 HCP_540436 HCP_541943 HCP_545345 HCP_552241 HCP_555651 HCP_555954 HCP_561444 HCP_567052 HCP_568963 HCP_571144 HCP_580347 HCP_580751 HCP_581349 HCP_583858 HCP_587664 HCP_590047 HCP_597869 HCP_599469 HCP_614439 HCP_615441 HCP_615744 HCP_622236 HCP_623844 HCP_627852 HCP_645450 HCP_647858 HCP_654350 HCP_656253 HCP_657659 HCP_660951 HCP_664757 HCP_668361 HCP_671855 HCP_673455 HCP_675661 HCP_677766 HCP_679568 HCP_680250 HCP_683256 HCP_685058 HCP_686969 HCP_687163 HCP_693764 HCP_695768 HCP_713239 HCP_715041 HCP_725751 HCP_727553 HCP_727654 HCP_729557 HCP_731140 HCP_735148 HCP_748258 HCP_748662 HCP_756055 HCP_763557 HCP_765056 HCP_771354 HCP_788674 HCP_788876 HCP_800941 HCP_802844 HCP_804646 HCP_812746 HCP_814548 HCP_816653 HCP_818455 HCP_820745 HCP_826454 HCP_833148 HCP_837560 HCP_841349 HCP_856766 HCP_856968 HCP_871762 HCP_872562 HCP_872764 HCP_873968 HCP_877269 HCP_878776 HCP_878877 HCP_885975 HCP_888678 HCP_889579 HCP_894067 HCP_901139 HCP_907656 HCP_911849 HCP_917255 HCP_919966 HCP_922854 HCP_926862 HCP_932554 HCP_937160 HCP_947668 HCP_951457 HCP_955465 HCP_957974 HCP_966975 HCP_978578 HCP_979984 HCP_983773 HCP_987983 HCP_992673 HCP_992774 HCP_993675 HCP_994273 ${fp}/rh.HarvardOxford_96Parcels.gcs
# mv ${fp}/lh.HarvardOxford_96Parcels.gcs ${ap}/lh.HarvardOxford_96Parcels.gcs
# mv ${fp}/rh.HarvardOxford_96Parcels.gcs ${ap}/rh.HarvardOxford_96Parcels.gcs
# printf "${GRN}[Freesurfer]${RED} Classifier ${ap}/xh.HarvardOxford_96Parcels.gcs have been saved.\n"
