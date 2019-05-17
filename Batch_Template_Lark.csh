#!/bin/tcsh

### Template for a batch running script from Richard, modify with the script you want to run on the line 22

echo "Starting Kaon Yield Estimation"
echo "I take as arguments the Run Number and max number of events!"
set RUNNUMBER=$1
set MAXEVENTS=-1
#MAXEVENTS=50000
if ( $1 ==  "" ) then
    echo "I need a Run Number!"
    exit 2
    else

    #Initialize hcana
    cd "/home/apps/hallC_analyzer/hcana"
    source "/home/apps/hallC_analyzer/hcana/setup.csh"
    cd "/home/${USER}/work/JLab/hallc_replay_kaonlt"
    source "/home/${USER}/work/JLab/hallc_replay_kaonlt/setup.csh"

    echo  "\n\nStarting Replay Script\n\n"
    hcana -l -q "SCRIPTS/COIN/PRODUCTION/replay_production_coin_hElec_pProt.C($RUNNUMBER,$MAXEVENTS)"

endif
