#disableJEC=1 to go faster

cmsRun Dumpers/workspaceStd.py metaConditions=MetaData/data/MetaConditions/Era2018_legacy_v1.json campaign=Era2018_legacy_v1_Summer20UL/ \
dataset=/EGamma/phys_higgs-Era2018_legacy_v1_Summer20UL-legacyRunII-v0-Run2018A-UL2018_MiniAODv2-v1-c777dc38be1a66893d88ae1b64c38638/USER \
doSystematics=1 doPdfWeights=0 disableJEC=1 dumpWorkspace=0 dumpTrees=1 maxEvents=100000 useAAA=True processType="data" processId="Data" \
lumiMask=/afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions18/13TeV/Legacy_2018/Cert_314472-325175_13TeV_Legacy2018_Collisions18_JSON.txt


