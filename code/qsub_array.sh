#!/bin/bash
#$ -S /bin/bash
#$ -l h_vmem=8G
#$ -l h_rt=16:00:00
#$ -N fstabulate
#$ -cwd
#$ -t 1-2336
#$ -e /cbica/projects/RBC/freesurfer_stats/HBN/fs-tabulate/analysis/logs
#$ -o /cbica/projects/RBC/freesurfer_stats/HBN/fs-tabulate/analysis/logs
dssource=ria+file:///cbica/projects/RBC/freesurfer_stats/HBN/fs-tabulate/input_ria#d9b36d5e-5da1-422b-a747-72ad2b58495e
pushgitremote=/cbica/projects/RBC/freesurfer_stats/HBN/fs-tabulate/output_ria/d9b/36d5e-5da1-422b-a747-72ad2b58495e
export DSLOCKFILE=/cbica/projects/RBC/freesurfer_stats/HBN/fs-tabulate/analysis/.SGE_datalad_lock

MAXWAIT=2700
sleeptime=$((RANDOM % MAXWAIT))
echo Sleeping for ${sleeptime}
sleep ${sleeptime}

batch_file_name=subject_ids.txt
subid=$(head -n ${SGE_TASK_ID} ${PWD}/code/${batch_file_name} | tail -n 1)
bash ${PWD}/code/participant_job.sh ${dssource} ${pushgitremote} ${subid}
