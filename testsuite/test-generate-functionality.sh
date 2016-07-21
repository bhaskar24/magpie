#!/bin/bash

source test-generate-common.sh
source test-config.sh

__GenerateFunctionalityTests_LegacySubmissionType() {
    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-run-hadoopterasort-functionality-legacysubmissiontype
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-run-testpig-functionality-legacysubmissiontype
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-legacysubmissiontype
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-legacysubmissiontype
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-run-sparkpi-functionality-legacysubmissiontype
        
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-legacysubmissiontype

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype

        sed -i \
            -e 's/export SPARK_JOB="\(.*\)"/export SPARK_JOB="sparkwordcount"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-legacysubmissiontype \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"hdfs:\/\/\/user\/\${USER}\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_COPY_IN_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_COPY_IN_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-legacysubmissiontype

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-legacysubmissiontype
    fi
    
    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-run-stormwordcount-functionality-legacysubmissiontype
    fi

    if [ "${submissiontype}" == "sbatch-srun" ]
    then
        sed -i -e 's/export MAGPIE_SUBMISSION_TYPE="\(.*\)"/export MAGPIE_SUBMISSION_TYPE="slurmsbatch"/' magpie.${submissiontype}*functionality-legacysubmissiontype
    elif [ "${submissiontype}" == "msub-slurm-srun" ]
    then
        sed -i -e 's/export MAGPIE_SUBMISSION_TYPE="\(.*\)"/export MAGPIE_SUBMISSION_TYPE="msubslurm"/' magpie.${submissiontype}*functionality-legacysubmissiontype
    fi
}

__GenerateFunctionalityTests_BadJobNames() {
    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-run-hadoopterasort-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-run-hadoopterasort-functionality-job-name-dollarsign
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-run-testpig-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-run-testpig-functionality-job-name-dollarsign
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-job-name-dollarsign
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-job-name-dollarsign
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-run-sparkpi-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-run-sparkpi-functionality-job-name-dollarsign
        
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-job-name-dollarsign

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-job-name-dollarsign

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-job-name-dollarsign

        sed -i \
            -e 's/export SPARK_JOB="\(.*\)"/export SPARK_JOB="sparkwordcount"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-job-name* \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-job-name* \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-job-name*

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"hdfs:\/\/\/user\/\${USER}\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-job-name* \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-job-name*

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_COPY_IN_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_COPY_IN_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-job-name* \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-job-name*

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-job-name*
    fi

    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-run-stormwordcount-functionality-job-name-whitespace
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-run-stormwordcount-functionality-job-name-dollarsign
    fi

    # Some job scripts use environment variable, some use command line
    # options.  So check for quoted situation first.  If no quotes,
    # add them.
    sed -i -e 's/\"<my job name>\"/test job/' magpie.${submissiontype}*functionality-job-name-whitespace
    sed -i -e 's/<my job name>/\"test job\"/' magpie.${submissiontype}*functionality-job-name-whitespace

    sed -i -e 's/\"<my job name>\"/test$job/' magpie.${submissiontype}*functionality-job-name-dollarsign
    sed -i -e 's/<my job name>/test$job/' magpie.${submissiontype}*functionality-job-name-dollarsign
}

__GenerateFunctionalityTests_AltConfFilesDir() {

    # Just set to the current CONF_DIR to make sure setting it works

    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-run-hadoopterasort-functionality-altconffilesdir
        sed -i -e 's/# export HADOOP_CONF_FILES="\(.*\)"/export HADOOP_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hadoop-run-hadoopterasort-functionality-altconffilesdir
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-run-testpig-functionality-altconffilesdir
        sed -i -e 's/# export HADOOP_CONF_FILES="\(.*\)"/export HADOOP_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hadoop-and-pig-run-testpig-functionality-altconffilesdir
        sed -i -e 's/# export PIG_CONF_FILES="\(.*\)"/export PIG_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hadoop-and-pig-run-testpig-functionality-altconffilesdir
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-altconffilesdir
        sed -i -e 's/# export HADOOP_CONF_FILES="\(.*\)"/export HADOOP_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-altconffilesdir
        sed -i -e 's/# export HBASE_CONF_FILES="\(.*\)"/export HBASE_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-altconffilesdir
        sed -i -e 's/# export ZOOKEEPER_CONF_FILES="\(.*\)"/export ZOOKEEPER_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-altconffilesdir
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-altconffilesdir
        sed -i -e 's/# export HADOOP_CONF_FILES="\(.*\)"/export HADOOP_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-altconffilesdir
        sed -i -e 's/# export HBASE_CONF_FILES="\(.*\)"/export HBASE_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-altconffilesdir
        sed -i -e 's/# export PHOENIX_CONF_FILES="\(.*\)"/export PHOENIX_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-altconffilesdir
        sed -i -e 's/# export ZOOKEEPER_CONF_FILES="\(.*\)"/export ZOOKEEPER_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-altconffilesdir
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-run-sparkpi-functionality-altconffilesdir
        
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-altconffilesdir

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir

        sed -i \
            -e 's/export SPARK_JOB="\(.*\)"/export SPARK_JOB="sparkwordcount"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"hdfs:\/\/\/user\/\${USER}\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_COPY_IN_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_COPY_IN_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-altconffilesdir
        
        sed -i \
            -e 's/# export SPARK_CONF_FILES="\(.*\)"/export SPARK_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' \
            magpie.${submissiontype}-spark-run-sparkpi-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir

        sed -i \
            -e 's/# export HADOOP_CONF_FILES="\(.*\)"/export HADOOP_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-altconffilesdir \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-altconffilesdir
    fi

    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-run-stormwordcount-functionality-altconffilesdir
        sed -i -e 's/# export STORM_CONF_FILES="\(.*\)"/export STORM_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-storm-run-stormwordcount-functionality-altconffilesdir
        sed -i -e 's/# export ZOOKEEPER_CONF_FILES="\(.*\)"/export ZOOKEEPER_CONF_FILES="'"${magpiescriptshomesubst}"'\/conf\/"/' magpie.${submissiontype}-storm-run-stormwordcount-functionality-altconffilesdir
    fi
}

__GenerateFunctionalityTests_TestAll() {
    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-run-hadoopterasort-functionality-testall
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-run-hadoopterasort-run-testpig-functionality-testall
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-run-zookeeperruok-functionality-testall
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-hbaseperformanceeval-run-phoenixperformanceeval-run-zookeeperruok-functionality-testall
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-run-sparkpi-functionality-testall
        
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-run-sparkpi-functionality-testall

        # terasort w/ rawnetworkfs doesn't work, skip
        # cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-run-hadoopterasort-run-sparkpi-functionality-testall

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-hadoopterasort-run-sparkpi-functionality-testall
    fi

    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-run-stormwordcount-run-zookeeperruok-functionality-testall
    fi

    files=`find . -maxdepth 1 -name "magpie.${submissiontype}*functionality-testall*"`
    if [ -n "${files}" ]
    then
        sed -i -e 's/export MAGPIE_JOB_TYPE="\(.*\)"/export MAGPIE_JOB_TYPE="testall"/' ${files}

        # Guarantee 60 minutes for the job that should last awhile
        ${functiontogettimeoutput} 60
        sed -i -e "s/${timestringtoreplace}/${timeoutputforjob}/" ${files}
    fi
}

__GenerateFunctionalityTests_InteractiveMode() {
    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-functionality-interactive-mode
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-functionality-interactive-mode
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-functionality-interactive-mode
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-interactive-mode
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-functionality-interactive-mode
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-functionality-interactive-mode
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-functionality-interactive-mode
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-interactive-mode
    fi

    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-functionality-interactive-mode
    fi

    files=`find . -maxdepth 1 -name "magpie.${submissiontype}*functionality-interactive-mode*"`
    if [ -n "${files}" ]
    then
        sed -i \
            -e 's/export MAGPIE_JOB_TYPE="\(.*\)"/export MAGPIE_JOB_TYPE="interactive"/' \
            ${files}

        # Guarantee atleast 5 mins for the job that should end quickly
        ${functiontogettimeoutput} 5
        sed -i -e "s/${timestringtoreplace}/${timeoutputforjob}/" ${files}
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/interactivemode-FILENAMESEARCHREPLACEKEY/" ${files}
    fi
}

__GenerateFunctionalityTests_Setuponlymode() {
    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-functionality-setuponly-mode
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-functionality-setuponly-mode
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-functionality-setuponly-mode
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-setuponly-mode
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-functionality-setuponly-mode
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-functionality-setuponly-mode
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-functionality-setuponly-mode
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-setuponly-mode
    fi

    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-functionality-setuponly-mode
    fi

    files=`find . -maxdepth 1 -name "magpie.${submissiontype}*functionality-setuponly-mode*"`
    if [ -n "${files}" ]
    then
        sed -i \
            -e 's/export MAGPIE_JOB_TYPE="\(.*\)"/export MAGPIE_JOB_TYPE="setuponly"/' \
            ${files}

        # Guarantee atleast 5 mins for the job that should end quickly
        ${functiontogettimeoutput} 5
        sed -i -e "s/${timestringtoreplace}/${timeoutputforjob}/" ${files}
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/setuponlymode-FILENAMESEARCHREPLACEKEY/" ${files}
    fi
}

__GenerateFunctionalityTests_JobTimeout() {
    
    # timeoutputforjob returned
    GetSecondsJob 30

    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-functionality-jobtimeout
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-functionality-jobtimeout
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-functionality-jobtimeout
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-jobtimeout
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-functionality-jobtimeout
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-functionality-jobtimeout
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-functionality-jobtimeout
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-jobtimeout
    fi

    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-functionality-jobtimeout
    fi

    files=`find . -maxdepth 1 -name "magpie.${submissiontype}*functionality-jobtimeout*"`
    if [ -n "${files}" ]
    then
        sed -i \
            -e 's/export MAGPIE_JOB_TYPE="\(.*\)"/export MAGPIE_JOB_TYPE="script"/' \
            -e 's/# export MAGPIE_SCRIPT_PATH="\(.*\)"/export MAGPIE_SCRIPT_PATH="'"${magpiescriptshomesubst}"'\/testsuite\/testscripts\/test-sleep.sh"/' \
            -e 's/# export MAGPIE_SCRIPT_ARGS="\(.*\)"/export MAGPIE_SCRIPT_ARGS="\-s '"${timeoutputforjob}"'"/' \
            ${files}

        # Guarantee atleast 5 mins for the job that should end quickly
        ${functiontogettimeoutput} 5
        sed -i -e "s/${timestringtoreplace}/${timeoutputforjob}/" ${files}
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/jobtimeout-FILENAMESEARCHREPLACEKEY/" ${files}
    fi
}

__GenerateFunctionalityTests_MagpieExports() {

    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hadoop-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hdfs-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hadoop-hdfs-functionality-checkexports

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-rawnetworkfs-functionality-checkexports
        sed -i -e 's/export HADOOP_FILESYSTEM_MODE="\(.*\)"/export HADOOP_FILESYSTEM_MODE="rawnetworkfs"/' magpie.${submissiontype}-hadoop-rawnetworkfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hadoop-rawnetworkfs-functionality-checkexports
    fi
    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hadoop-and-pig-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hdfs-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hadoop-and-pig-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/pig-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hadoop-and-pig-functionality-checkexports
    fi
    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hbase-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hdfs-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/zookeeper-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-functionality-checkexports
    fi
    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/phoenix-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hbase-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hdfs-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/zookeeper-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-checkexports
    fi
    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-functionality-checkexports
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-functionality-checkexports
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-functionality-checkexports
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-checkexports

        sed -i -e "s/FILENAMESEARCHREPLACEKEY/spark-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-functionality-checkexports

        sed -i -e "s/FILENAMESEARCHREPLACEKEY/spark-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hdfs-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-hdfs-functionality-checkexports

        sed -i -e "s/FILENAMESEARCHREPLACEKEY/spark-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-yarn-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-yarn-functionality-checkexports

        sed -i -e "s/FILENAMESEARCHREPLACEKEY/spark-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hadoop-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/hdfs-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-checkexports
    fi
    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/storm-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-storm-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/zookeeper-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-storm-functionality-checkexports
    fi
    if [ "${zookeepertests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-zookeeper-functionality-checkexports
        sed -i -e 's/export STORM_SETUP=yes/export STORM_SETUP=no/' magpie.${submissiontype}-zookeeper-functionality-checkexports
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/zookeeper-FILENAMESEARCHREPLACEKEY/" magpie.${submissiontype}-zookeeper-functionality-checkexports
    fi

    files=`find . -maxdepth 1 -name "magpie.${submissiontype}*functionality-checkexports*"`
    if [ -n "${files}" ]
    then
        sed -i -e 's/export MAGPIE_JOB_TYPE="\(.*\)"/export MAGPIE_JOB_TYPE="script"/' ${files}
        sed -i -e 's/# export MAGPIE_SCRIPT_PATH="\(.*\)"/export MAGPIE_SCRIPT_PATH="'"${magpiescriptshomesubst}"'\/testsuite\/testscripts\/test-env.sh"/' ${files}
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/checkexports-FILENAMESEARCHREPLACEKEY/" ${files}
    fi
}

__GenerateFunctionalityTests_PrePostRunScripts() {
    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-run-hadoopterasort-functionality-prepostrunscripts
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-run-testpig-functionality-prepostrunscripts
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-run-hbaseperformanceeval-functionality-prepostrunscripts
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-run-phoenixperformanceeval-functionality-prepostrunscripts
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-run-sparkpi-functionality-prepostrunscripts
        
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-prepostrunscripts

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts

        sed -i \
            -e 's/export SPARK_JOB="\(.*\)"/export SPARK_JOB="sparkwordcount"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-prepostrunscripts \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"hdfs:\/\/\/user\/\${USER}\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_COPY_IN_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_COPY_IN_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-run-sparkwordcount-copy-in-functionality-prepostrunscripts

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-yarn-run-sparkwordcount-copy-in-functionality-prepostrunscripts
    fi
    
    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-run-stormwordcount-functionality-prepostrunscripts
    fi

    files=`find . -maxdepth 1 -name "magpie.${submissiontype}*functionality-prepostrunscripts*"`
    if [ -n "${files}" ]
    then
        sed -i -e 's/# export MAGPIE_PRE_JOB_RUN="\(.*\)"/export MAGPIE_PRE_JOB_RUN="'"${magpiescriptshomesubst}"'\/testsuite\/testscripts\/test-pre-job-run.sh"/' ${files}
        sed -i -e 's/# export MAGPIE_POST_JOB_RUN="\(.*\)"/export MAGPIE_POST_JOB_RUN="'"${magpiescriptshomesubst}"'\/testsuite\/testscripts\/test-post-job-run.sh"/' ${files}
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/prepostrunscripts-FILENAMESEARCHREPLACEKEY/" ${files}
    fi
}

__GenerateFunctionalityTests_PreRunScriptError() {
    if [ "${hadooptests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop magpie.${submissiontype}-hadoop-functionality-prerunscripterror
    fi

    if [ "${pigtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hadoop-and-pig magpie.${submissiontype}-hadoop-and-pig-functionality-prerunscripterror
    fi

    if [ "${hbasetests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs magpie.${submissiontype}-hbase-with-hdfs-functionality-prerunscripterror
    fi

    if [ "${phoenixtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-hbase-with-hdfs-with-phoenix magpie.${submissiontype}-hbase-with-hdfs-with-phoenix-functionality-prerunscripterror
    fi

    if [ "${sparktests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark magpie.${submissiontype}-spark-functionality-prerunscripterror
        
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-hdfs magpie.${submissiontype}-spark-with-hdfs-functionality-prerunscripterror

        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn magpie.${submissiontype}-spark-with-yarn-functionality-prerunscripterror
        
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-spark-with-yarn-and-hdfs magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-prerunscripterror
        
        sed -i \
            -e 's/export SPARK_JOB="\(.*\)"/export SPARK_JOB="sparkwordcount"/' \
            magpie.${submissiontype}-spark-with-hdfs-functionality-prerunscripterror \
            magpie.${submissiontype}-spark-with-yarn-functionality-prerunscripterror \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-prerunscripterror

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"hdfs:\/\/\/user\/\${USER}\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-functionality-prerunscripterror \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-prerunscripterror

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_COPY_IN_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_COPY_IN_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-hdfs-functionality-prerunscripterror \
            magpie.${submissiontype}-spark-with-yarn-and-hdfs-functionality-prerunscripterror

        sed -i \
            -e 's/# export SPARK_SPARKWORDCOUNT_FILE="\(.*\)"/export SPARK_SPARKWORDCOUNT_FILE=\"file:\/\/'"${magpiescriptshomesubst}"'\/testsuite\/testdata\/test-wordcountfile\"/' \
            magpie.${submissiontype}-spark-with-yarn-functionality-prerunscripterror
    fi
    
    if [ "${stormtests}" == "y" ]; then
        cp ../submission-scripts/script-${submissiontype}/magpie.${submissiontype}-storm magpie.${submissiontype}-storm-functionality-prerunscripterror
    fi
    
    files=`find . -maxdepth 1 -name "magpie.${submissiontype}*functionality-prerunscripterror*"`
    if [ -n "${files}" ]
    then
        sed -i -e 's/# export MAGPIE_PRE_JOB_RUN="\(.*\)"/export MAGPIE_PRE_JOB_RUN="'"${magpiescriptshomesubst}"'\/testsuite\/testscripts\/test-pre-job-run-error.sh"/' ${files}
        sed -i -e "s/FILENAMESEARCHREPLACEKEY/prerunscripterror-FILENAMESEARCHREPLACEKEY/" ${files}
    fi
}

GenerateFunctionalityTests() {

    cd ${MAGPIE_SCRIPTS_HOME}/testsuite/
    
    echo "Making Functionality Tests"

    __GenerateFunctionalityTests_LegacySubmissionType

    __GenerateFunctionalityTests_BadJobNames

    __GenerateFunctionalityTests_AltConfFilesDir

    __GenerateFunctionalityTests_TestAll
    
    __GenerateFunctionalityTests_InteractiveMode

    __GenerateFunctionalityTests_Setuponlymode

    __GenerateFunctionalityTests_JobTimeout

    __GenerateFunctionalityTests_MagpieExports

    __GenerateFunctionalityTests_PrePostRunScripts

    __GenerateFunctionalityTests_PreRunScriptError
}
