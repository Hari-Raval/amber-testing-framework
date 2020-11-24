import os
import sys
import subprocess
import pdb

def my_exec(cmd):
    print(cmd)
    res = os.system(cmd)
    if res != 0:
        print("failed executing command:")
        print(cmd)
        exit(0)
    
configs = ["plain", "chunked", "round_robin"]
#configs = ["chunked", "round_robin"]

assert(len(sys.argv) == 2)
test_path = sys.argv[1]

for c in configs:
    root_dir = test_path + "/" + c + "/"
    for fname in os.listdir(root_dir):
        my_exec("rm -rf build")
        fname = root_dir + "/" + fname + "/" + fname + ".metal"
        print(fname)
        my_exec("cp " + fname + " TesterTemplate/test.metal")
        my_exec("xcodebuild > /dev/null")        
        for i in range(5):
            my_exec("./build/Release/TesterTemplate")
        
