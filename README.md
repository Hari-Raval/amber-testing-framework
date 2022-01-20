## Amber-Testing-Framework
This repository contains scripts to automatically generate Amber tests for formatted input files along with examples of test cases and sample outputs

## Overview

In summary, the contributions of this work include creating a compiler that takes in a high-level
description of a progress test and coverts it to an executable test. In this compiler, we provide two heuristics that aim to saturate a GPU’s resources and thus, reveal more interesting behaviors. The compiler also includes three configurations that test different levels of the GPU execution hierarchy. In addition to this compiler, we create a driver that executes many of the tests we produce and moreover gracefully recovers from an assortment of erratic timeout behaviors observed in our testing campaign. We evaluate our tools by running over 700 tests across multiple GPUs from different vendors such as AMD, Intel, and Nvidia as well as a GPU emulator (Swiftshader), which is executed on a CPU. My test results show a variety of progress issues across these devices, including violations of notions of fairness. In our analysis of the results, we compare the different GPUs and find that some devices
reliably fail more tests than others, showing the importance of a portable testing framework.

## Publication

The published work associated with this repository can be found (here) (https://dl.acm.org/doi/abs/10.1145/3485508?af=R)

## Running the scripts:

amber_test_generation.py script: `python3 amber_test_generation.py input_file output_file_name`

- Note 1: the output_file_name should not end with ".amber" as the script will automatically add that extension to the provided name)
- Note 2: Make sure configuration.py is in the same working directory as amber_test_generation.py

amber_test_driver.py script: `amber_test_driver.py [-h] [--android] input_dir num_iterations`

- Note 1: Some of the paths and flags need to be edited in main() based off of where the script is being run relative to amber build 

configuration.py: Object file that cannot be run independently 
- Note 1: This Configuration object is used in amber_test_generation.py and amber_test_driver.py


 
