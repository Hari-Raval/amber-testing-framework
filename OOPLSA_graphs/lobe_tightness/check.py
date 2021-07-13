import os
import pdb
import re

base_path = "../../Driver_and_Comparator_Results/"
base_path2 = "../../extra_results/"


devices = ["GeForce 940M", "Quadro RTX 4000", "A14", "A12", "Mali-G77", "Adreno 620", "Tegra X1", "Intel HD620"]

device_alias = {"Quadro RTX 4000": "CUDA/toucan_quadro_rtx4000-inter-workgroup.csv",
                "GeForce 940M" : "CUDA/laptop_940m-inter-workgroup.csv",
                "A14" : "Apple/iphone_12_a14-inter-workgroup.csv",
                "A12" : "Apple/ipad_air_3_a12-inter-workgroup.csv",
                "Mali-G77": "galaxy-s20-mali-2021-02-07",
                "Adreno 620" : "pixel5-adreno-2021-02-06",
                "Tegra X1" : "results-NVIDIA-SHIELD-Android-TV",
                "Intel HD620": "intelHD620-2021-03-16"}


config = ["2_thread_2_instruction",
          "2_thread_3_instruction",
          "2_thread_4_instruction",
          "3_thread_3_instruction",
          "3_thread_4_instruction"]

config_alias = {"2_thread_2_instruction" : "output0",
                "2_thread_3_instruction" : "output1",
                "2_thread_4_instruction" : "output2",
                "3_thread_3_instruction" : "output3",
                "3_thread_4_instruction" : "output4"}


def get_data(fname):
    f = open(fname, 'r')
    ret = f.read()
    f.close()
    return ret

def find_ff_d_tests(c):
    ret = []
    p = os.path.join(base_path,c,"schedulers/LOBE_STRONG_results.csv")
    data = get_data(p).split("\n")[1:-2]
    for t in data:
        if "F" in t:
            num = int(t.split(",")[0])
            ret.append(num)

    return ret

def get_failed_and_total(s):
    tt = re.match('.*\((\d+)/(\d+)\).*',s)
    assert(tt)
    return int(tt[1]),int(tt[2])

def check_res(res):
    res = res.split(",")[3]
    if "P" in res:
        return "P"
    f,t = get_failed_and_total(res)
    if f == t:
        return "D"
    return "N"

def get_csv_path(d,c):
    if d in ["Quadro RTX 4000", "A14", "A12", "GeForce 940M"]:
        da = device_alias[d]
        return os.path.join(base_path,c,da)
    else:
        da = device_alias[d]
        dr = config_alias[c]
        # maybe name has different date for different chips?
        fname = "iteration_based_final_results.csv"
        return os.path.join(base_path2,da,dr,fname)

def split_d(d):
    d = d.split("\n")
    while d[-1] == '':
        d = d[:-1]
    assert("Total" in d[-1])
    assert("Test File" in d[0])
    return d[1:-1]


for c in config:
    r = find_ff_d_tests(c)
    for d in devices:
        c_d = 0
        c_n = 0
        p = get_csv_path(d,c)
        data = split_d(get_data(p))
        for t in r:
            v = check_res(data[t])
            if v == "N":                
                print("non-det:",c,d,t)
                c_n += 1                
            if v == "P":
                print("passed:",c,d,t)
            if v == "D":
                c_d += 1

        print("total:", d, c_d, c_n)
            
        
    
