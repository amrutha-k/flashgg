nEvents=-1
outdir=untaggedTag_UL18_data_new
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/UL18_data.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/r/rgargiul/dataHggWidth/trees/trees_postVBFcat_data \
    -d $outdir \
    -q $queue \
    -H \
    -n 1000 \
    --no-copy-proxy -D -P \
    --no-use-tarball \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=False
