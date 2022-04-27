## MicroAOD production
I followed [this tutorial](https://indico.cern.ch/event/963617/#b-397836-flashgg-tutorial-seri) for producing microAODs. A lot of information 
on producing microAODs can also be found [here](https://github.com/amrutha-k/flashgg/blob/7a42c9baf4ff11c995337eb15555ee59af7395dc/MetaData/README.md).

### Error
A common error while running crab jobs for this clone of flashgg is given below:
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
The workaround for this error is to copy the directory flashgg/MicroAOD/data to CMSSW_10_6_8/external/slc7_amd64_gcc700/data :
```
cd $CMSSW_BASE/src/flashgg
mkdir ../../external/slc7_amd64_gcc700/data/
cp MicroAOD/data/* ../../external/slc7_amd64_gcc700/data/
```
Note: Some of the .xml files in the data directory are very large in size and this may create problems while creating tarball for microAOD production. So it is better to copy only the required .xml files in your $CMSSW_BASE/external/slc7_amd64_gcc700/data/ folder. Or you can copy the whole "data" directory and then delete the large .xml files which you don't use in your metaConditions json file.

You should make one more change (given below) in the metaconditions json to fix the issue:
```
"photonIdMVAweightfile_EB" : "flashgg/MicroAOD/data/HggPhoId_94X_barrel_BDT_v2.weights.xml", -> "photonIdMVAweightfile_EB" : "HggPhoId_94X_barrel_BDT_v2.weights.xml",
"photonIdMVAweightfile_EE" : "flashgg/MicroAOD/data/HggPhoId_94X_endcap_BDT_v2.weights.xml", -> "photonIdMVAweightfile_EE" : "HggPhoId_94X_endcap_BDT_v2.weights.xml",
"vertexIdMVAweightfile" : "flashgg/MicroAOD/data/TMVAClassification_BDTVtxId_SL_2016.xml", -> "vertexIdMVAweightfile" : "TMVAClassification_BDTVtxId_SL_2016.xml",
"vertexProbMVAweightfile" : "flashgg/MicroAOD/data/TMVAClassification_BDTVtxProb_SL_2016.xml" -> "vertexProbMVAweightfile" : "TMVAClassification_BDTVtxProb_SL_2016.xml" 
```
