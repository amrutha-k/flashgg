nEvents=-1
outdir=UntaggedTag_dump_hggInt_UL17_sigMC
dumper=$CMSSW_BASE/src/flashgg/Dumpers/diphoton_dumper.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/hgg_width_UL17_sigMC.json

fggRunJobs.py  \
    --load $json \
    -d $outdir \
    -q $queue \
    -n 100 \
    --no-copy-proxy -D -P \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=False
