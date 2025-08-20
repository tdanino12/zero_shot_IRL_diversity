#!/bin/bash
env="Overcooked"

layout=$1
population_size=$2

if [[ "${layout}" == "random0" || "${layout}" == "random0_medium" || "${layout}" == "random1" || "${layout}" == "random3" || "${layout}" == "small_corridor" || "${layout}" == "unident_s" ]]; then
    version="old"
else
    version="new"
fi

# echo pop_size ${population_size}

if [[ ${population_size} == 3 ]]; then
    entropy_coefs="0.2 0.05 0.01"
    entropy_coef_horizons="0 2.5e7 5e7"
    if [[ "${layout}" == "small_corridor" ]]; then
        entropy_coefs="0.2 0.05 0.01"
        entropy_coef_horizons="0 4e7 5e7"
    fi
    reward_shaping_horizon="5e7"
    num_env_steps="5e7"
    pop="mep-S1-s4-diversity"
    mep_prioritized_alpha=0.5
elif [[ ${population_size} == 24 ]]; then
    entropy_coefs="0.2 0.05 0.01"
    entropy_coef_horizons="0 4e7 8e7"
    if [[ "${layout}" == "small_corridor" ]]; then
        entropy_coefs="0.2 0.05 0.01"
        entropy_coef_horizons="0 6.4e7 8e7"
    fi
    reward_shaping_horizon="8e7"
    num_env_steps="8e7"
    pop="mep-S1-s10"
    mep_prioritized_alpha=1.0
elif [[ ${population_size} == 36 ]]; then
    entropy_coefs="0.2 0.05 0.01"
    entropy_coef_horizons="0 5e7 1e8"
    if [[ "${layout}" == "small_corridor" ]]; then
        entropy_coefs="0.2 0.05 0.01"
        entropy_coef_horizons="0 8e7 1e8"
    fi
    reward_shaping_horizon="1e8"
    num_env_steps="1e8"
    pop="mep-S1-s15"
    mep_prioritized_alpha=1.5
fi