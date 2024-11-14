# CRAB3 config template for flashgg
# More options available on the twiki :
# https://twiki.cern.ch/twiki/bin/view/CMSPublic/WorkBookCRAB3Tutorial
# To actually prepare the jobs, please execute prepareCrabJobs.py

from WMCore.Configuration import Configuration
config = Configuration()
import os

config.section_("General")
config.General.requestName = "legacyRunII_GluGluHToGG_M120_13TeV-sherpa_Summer20UL18_ext1-v2_00"
config.General.transferLogs = False

config.section_("JobType")
config.JobType.pluginName = "Analysis"
config.JobType.psetName = "microAODstd.py"

## to include local file in the sendbox, this will put the file in the directory where cmsRun runs
config.JobType.inputFiles = ['QGL_AK4chs_94X.db']

## incrase jobs time wall, maximum 2750 minutes (~46 hours)
#config.JobType.maxJobRuntimeMin = 2750

#config.JobType.maxMemoryMB = 2500 # For memory leaks. NB. will block jobs on many sites
## config.JobType.scriptExe = "cmsWrapper.sh"
config.JobType.pyCfgParams = ['datasetName=/GluGluHToGG_M120_13TeV-sherpa/RunIISummer20UL18MiniAODv2-106X_upgrade2018_realistic_v16_L1v1_ext1-v2/MINIAODSIM', 'processType=signal', 'conditionsJSON=/afs/cern.ch/work/r/rgargiul/CMSSW_10_6_29/src/flashgg/MetaData/data/MetaConditions/Era2018_legacy_v1.json']

config.JobType.sendExternalFolder = True

config.section_("Data")
config.Data.inputDataset = "/GluGluHToGG_M120_13TeV-sherpa/RunIISummer20UL18MiniAODv2-106X_upgrade2018_realistic_v16_L1v1_ext1-v2/MINIAODSIM"
config.Data.inputDBS = 'global'
config.Data.splitting = "EventAwareLumiBased"
config.Data.unitsPerJob = 25000
config.Data.publication = True
config.Data.publishDBS = 'phys03'
config.Data.outputDatasetTag = 'Era2018_legacy_v1_Summer20UL-legacyRunII-v0-RunIISummer20UL18MiniAODv2-106X_upgrade2018_realistic_v16_L1v1_ext1-v2'
config.Data.outLFNDirBase = "/store/group/phys_higgs/cmshgg/rgargiul/flashgg/Era2018_legacy_v1_Summer20UL/legacyRunII"

config.section_("Site")
config.Site.storageSite = "T2_CH_CERN"
config.Site.blacklist = ["T2_US_Nebraska"]
#config.Site.blacklist = ["T2_UK_London_Brunel","T1_US_FNAL","T2_US_MIT"]

config.Data.totalUnits = 25000
config.Data.publication = False
config.General.requestName = "pilot_legacyRunII_GluGluHToGG_M120_13TeV-sherpa_Summer20UL18_ext1-v2_00"
