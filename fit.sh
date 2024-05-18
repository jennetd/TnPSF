year=$1

python sf.py --fit single -t templates/${year}/TnPtemplates_var.root -o ${year}-FitSingle --scale 3 --smear 0.5
cd ${year}-FitSingle
. build.sh
combine -M FitDiagnostics --expectSignal 1 -d model_combined.root --saveShapes --saveWithUncertainties --rMin 0 --rMax 2 --verbose 9
python ../results.py --year=${year} --scale 3 --smear 0.5
