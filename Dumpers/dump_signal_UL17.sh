nEvents=-1
outdir=sigSummer20UL17_EtDepScSm_noCats
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/UL17_sigMC_EtDepSndS.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/a/amkrishn/hggWidth/mcNtuples/condor_output/2017/sigSummer20UL17_EtDepScSm_noCats \
    -d $outdir \
    -q $queue \
    -n 100 \
    -D -P \
    --no-use-tarball \
    --no-copy-proxy \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=True
