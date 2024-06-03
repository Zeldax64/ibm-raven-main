#!/bin/bash

set -eu

DATASET_DIR='_data'
RAVEN_DATASET="$DATASET_DIR/raven"

RAVEN_REPO='dataset/raven'

function download_raven() {
    local wd=$PWD
    local dataset=RAVEN-10000-release.zip

    mkdir -p $DATASET_DIR

    source _venv/bin/activate
    cd $DATASET_DIR
    pip install gdown
    # Original RAVEN-10000 dataset provided by the paper's authors
    gdown 111swnEzAY2NfZgeyAhVwQujMjRUfeyuY -O "$dataset"
    deactivate

    echo "Unzipping dataset..."
    unzip -q "$dataset"
    rm "$dataset"

    cd $wd
}

function setup_venv() {
    python3 -m venv _venv
    source _venv/bin/activate
    pip install -e nvsa
    pip install -r requirements.txt

    # Install required packages
    pip install gdown
    deactivate
}

setup_venv
download_raven

