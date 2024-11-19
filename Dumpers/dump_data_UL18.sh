nEvents=-1
outdir=dataSummer19UL18_5cats_newFNUF_2018D
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=workday
json=$CMSSW_BASE/src/flashgg/Dumpers/UL18D_data.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/a/amkrishn/hggWidth/mcNtuples/condor_output/2018/dataSummer19UL18_5cats_newFNUF_2018D \
    -d $outdir \
    -q $queue \
    -n 1000 \
    -D -P \
    --no-use-tarball \
    --no-copy-proxy \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=True
