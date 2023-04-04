## Dumper for Hgg width measurement
* First produce MicroAODs, then create catalog in MetaData/data/ following the steps given [here](https://github.com/amrutha-k/flashgg/tree/HggWidth/MetaData#importing-datasets-from-dbs).
* Then create a json file with correct customizations (eg: hgg_width_UL17_sigMC.json)
* Change MetaData/data/cross_sections.json if needed. Cross section could be calculated using the [GenXsecAnalyzer](https://twiki.cern.ch/twiki/bin/viewauth/CMS/HowToGenXSecAnalyzer). Also, see [SM higgs production cross-sections](https://twiki.cern.ch/twiki/bin/view/LHCPhysics/CERNYellowReportPageAt1314TeV2014#s_13_5_TeV). 
* Run the dumper locally:
```
cd ..
cmsRun Dumpers/diphoton_dumper.py metaConditions=MetaData/data/MetaConditions/Era2017_legacy_v1.json campaign=GluGluHToGG_int_M125_13TeV/ dataset=/GluGluHToGG_int_M125_13TeV-sherpa/phys_higgs-crab_v0_GluGluHToGG_int_M125_13TeV-sherpa_RunIISummer20UL17MiniAOD-106X_mc2017_realistic_v6-v2_00-467e9e21904518f354c32e2b169db7c8/USER doSystematics=1 doPdfWeights=0 dumpWorkspace=0 dumpTrees=1 dumpGenWeight=True maxEvents=500
```
If all go well and output makes sense, 
```
voms-proxy-init -voms cms --valid 168:00
cp /tmp/MYPROXY ~/
export X509_USER_PROXY=~/MYPROXY

source Dumpers/dump_signal_UL17.sh
```

