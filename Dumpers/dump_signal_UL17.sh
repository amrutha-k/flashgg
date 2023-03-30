nEvents=-1
outdir=untaggedTag_m125_UL17_bkgMC
dumper=$CMSSW_BASE/src/flashgg/Dumpers/diphoton_dumper.py
queue=tomorrow
json=$CMSSW_BASE/src/flashgg/Dumpers/UL17_bkgMC.json

fggRunJobs.py  \
    --load $json \
    --stage-to /eos/user/a/amkrishn/hggWidth/mcNtuples/condor_output/2017/untaggedTag_m125_UL17_bkgMC \
    -d $outdir \
    -q $queue \
    -n 100 \
    --no-copy-proxy -D -P \
    -x cmsRun $dumper maxEvents=$nEvents copyInputMicroAOD=False
