import os
import pdb
import re

base_path = "../../Driver_and_Comparator_Results/"
#base_path2 = "../../extra_results/"


devices = ["Quadro RTX 4000"]

device_alias = {"Quadro RTX 4000": "CUDA/toucan_quadro_rtx4000_coop-inter-workgroup.csv"}

config = ["2_thread_2_instruction",
          "2_thread_3_instruction",
          "2_thread_4_instruction",
          "3_thread_3_instruction",
          "3_thread_4_instruction"]

def get_data(fname):
    f = open(fname, 'r')
    ret = f.read()
    f.close()
    return ret

def find_ff_d_tests(c):
    ret = []
    p = os.path.join(base_path,c,"schedulers/WEAK_FAIR_results.csv")
    data = get_data(p).split("\n")[1:-2]
    for t in data:
        if "P" in t:
            num = int(t.split(",")[0])
            ret.append(num)

    return ret

def find_ff_d_tests2(c):
    ret = []
    p = os.path.join(base_path,c,"schedulers/STRONG_FAIR_results.csv")
    data = get_data(p).split("\n")[1:-2]
    for t in data:
        if "P" in t:
            num = int(t.split(",")[0])
            ret.append(num)

    return ret


def get_failed_and_total(s):
    tt = re.match('.*\((\d+)/(\d+)\).*',s)
    assert(tt)
    return int(tt[1]),int(tt[2])

def check_res(res):
    res = res.split(",")[1:4]
    for r in res:
        if "P" not in r:
            #pdb.set_trace()
            return "F",res
    return "P",res

def get_csv_path(d,c):
    if d in ["Quadro RTX 4000", "A14", "A12"]:
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
    c_d = 0
    for d in devices:
        dp = device_alias[d]
        p = get_csv_path(d,c)
        data = split_d(get_data(p))

        for t in r:
            v,vv = check_res(data[t])
            if v in ["F"]:
                assert(False)
                #if v == "P":
                #print("passed:",c,d,t)
                #if v == "D":
                #c_d += 1



print("passed weak fair")

c_d = 0
c_n = 0
for c in config:
    r = find_ff_d_tests2(c)
    for d in devices:
        dp = device_alias[d]
        p = get_csv_path(d,c)
        data = split_d(get_data(p))

        for t in r:
            v,vv = check_res(data[t])
            if v in ["F"]:
                c_d+=1
                print("found fail",c,t,d,vv)
            #if v in ["N"]:
            #    c_n+=1
            
                #if v == "P":
                #print("passed:",c,d,t)
                #if v == "D":
                #c_d += 1

print("failed strong fairness tests:", c_d)


