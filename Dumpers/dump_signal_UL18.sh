nEvents=-1
outdir=sigSummer20UL18_newFNUF
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/UL18_sigMC.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/a/amkrishn/hggWidth/mcNtuples/condor_output/2018/sigSummer20UL18_newFNUF \
    -d $outdir \
    -q $queue \
    -n 100 \
    -D -P \
    --no-copy-proxy \
    --no-use-tarball \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=True \
