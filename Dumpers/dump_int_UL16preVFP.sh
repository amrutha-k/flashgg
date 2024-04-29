nEvents=-1
outdir=intggSummer20UL16preVFPnoCats
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/UL16preVFP_intgg.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/a/amkrishn/hggWidth/mcNtuples/condor_output/2016preVFP/intggSummer20UL16preVFPnoCats \
    -d $outdir \
    -q $queue \
    -n 100 \
    -D -P \
    --no-use-tarball \
    --no-copy-proxy \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=True
