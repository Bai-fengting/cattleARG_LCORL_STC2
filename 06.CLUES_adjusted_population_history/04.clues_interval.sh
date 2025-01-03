iv=${1}

for pos in `cat interval_${iv}/pos_list.txt`
do
	bash 02.clues.sh ${iv} ${pos}
done
