## MicroAOD production
I followed [this tutorial](https://indico.cern.ch/event/963617/#b-397836-flashgg-tutorial-seri) for producing microAODs. A lot of information 
on producing microAODs can also be found [here](https://github.com/amrutha-k/flashgg/blob/7a42c9baf4ff11c995337eb15555ee59af7395dc/MetaData/README.md).

**N.B.:** use the following cmsRun command:
```
cmsRun MicroAOD/test/microAODstd.py processType=sig datasetName=/GluGluHToGG_int_M125_13TeV-sherpa/RunIISummer20UL17MiniAOD-106X_mc2017_realistic_v6-v2/MINIAODSIM conditionsJSON=MetaData/data/MetaConditions/Era2017_legacy_v1.json
```

LHE collection we use in flashgg to access pdf/alpha weights and STXS information are missing in the interference MiniAOD samples. To avoid errors due to that, comment out lines 227-248 [here](https://github.com/amrutha-k/flashgg/blob/aed0a5a142d7d65998df27f74abee57f8035a708/MicroAOD/python/MicroAODCustomize.py) (flashgg/MicroAOD/python/MicroAODCustomize.py)

### Error
A common error while running crab jobs to produce microAODs for this clone of flashgg is given below:
```
94 jobs failed with exit code 7002:

      94 jobs failed with following error message: (for example, job 1)

               CmsRunFailure
               CMSSW error message follows.
               Fatal Exception
               An exception of category 'ConfigFileReadError' occurred while
                  [0] Processing the python configuration file named PSet.py
               Exception Message:
               python encountered the error: <type 'exceptions.RuntimeError'>
               edm::FileInPath unable to find file flashgg/MicroAOD/data/TMVAClassification_BDTVtxId_SL_2016.xml anywhere in the search path.
               The search path is defined by: CMSSW_SEARCH_PATH
               ${CMSSW_SEARCH_PATH} is: /srv/CMSSW_10_5_0/poison:/srv/CMSSW_10_6_8/src:/srv/CMSSW_10_6_8/external/slc7_amd64_gcc700/data:/cvmfs/cms.cern.ch/slc7_amd64_gcc700/cms/cmssw/CMSSW_10_6_8/src:/cvmfs/cms.cern.ch/slc7_amd64_gcc700/cms/cmssw/CMSSW_10_6_8/external/slc7_amd64_gcc700/data
               Current directory is: /srv
```
A workaround for this error is to copy the directory `/eos/cms/store/group/phys_higgs/cmshgg/flashgg/MicroAOD/data` to local `flashgg/MicroAOD/data` directory. Command to copy all the files from eos:
```
fggPopulateDataDir.sh -d MicroAOD/data/
```
Note: Some of the .xml files in the data directory are very large in size and this may create problems while creating tarball for microAOD production. So it is better to copy only the required .xml files to your local directory. Or you can copy the whole "data" directory and then delete the large .xml files which you don't use in your metaConditions json file.


