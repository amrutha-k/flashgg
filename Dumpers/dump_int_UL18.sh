nEvents=-1
outdir=untaggedTag_UL18_intMC_new
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/UL18_int.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/r/rgargiul/amrutha_ws/signal_trees/untaggedTag_UL18_intMC_vbfcat \
    -d $outdir \
    -q $queue \
    -n 1000 \
    --no-copy-proxy -D -P \
    --no-use-tarball \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=False
