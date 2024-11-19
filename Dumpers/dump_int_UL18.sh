nEvents=-1
outdir=intggSummer20UL18genweightVector
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=workday
json=$CMSSW_BASE/src/flashgg/Dumpers/UL18_intgg.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/a/amkrishn/hggWidth/mcNtuples/condor_output/2018/intggSummer20UL18genweightVector/ \
    -d $outdir \
    -q $queue \
    -n 100 \
    -D -P \
    --no-use-tarball \
    --no-copy-proxy \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=True
