nEvents=-1
outdir=untaggedTag_UL18_sigMC_new
dumper=$CMSSW_BASE/src/flashgg/Dumpers/workspaceStd.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/UL18_sig.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/r/rgargiul/dataHggWidth/trees/trees_preVBFcat_sig \
    -d $outdir \
    -q $queue \
    -n 1000 \
    --no-copy-proxy -D -P \
    --no-use-tarball \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=False