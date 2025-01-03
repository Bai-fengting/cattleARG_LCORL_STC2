for state in {"anc","mut"}
do 
	mast -hit_list --best ~/software/jasper_database/JASPAR2024_CORE_vertebrates_redundant_pfms_meme.txt ARS-UCD1.2_Btau5.0.1Y_20_4967400_4969800_${state}.fa
done
