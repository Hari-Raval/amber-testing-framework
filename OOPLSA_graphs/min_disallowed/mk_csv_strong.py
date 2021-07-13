# doesn't actually make a csv, but prints out useful data you have to copy by hand into the CSV

import os
import pdb
data_path = "../../Amber-Testing-Framework/Driver_and_Comparator_Results"

runs = ["2_thread_2_instruction",
        "2_thread_3_instruction",
        "2_thread_4_instruction",
        "3_thread_3_instruction",
        "3_thread_4_instruction",]

runs_alias = {"2_thread_2_instruction" : "2t\\\_2i",
        "2_thread_3_instruction" : "2t\\\_3i",
        "2_thread_4_instruction" : "2t\\\_4i",
        "3_thread_3_instruction" : "3t\\\_3i",
        "3_thread_4_instruction" : "3t\\\_4i"}

post_fix = "schedulers"

scheduler_order = ["STRONG_FAIR_results.csv", "LOBE_STRONG_results.csv", "HSA_OBE_STRONG_results.csv", "OBE_STRONG_results.csv", "HSA_STRONG_results.csv","WEAK_FAIR_results.csv", "LOBE_results.csv", "HSA_OBE_results.csv", "OBE_results.csv", "HSA_results.csv"]

def get_fcontents(fpath):
    f = open(fpath)
    data = f.read()
    f.close()
    return data.split("\n")[1:-2]

#populate sets for all schedulers
STRONG_FAIR_SET = {}
STRONG_FAIR = {}
for r in runs:
    STRONG_FAIR[r] = get_fcontents(os.path.join(data_path,r,post_fix,"STRONG_FAIR_results.csv"))
    STRONG_FAIR_SET[r] = set()

STRONG_LOBE_SET = {}
STRONG_LOBE = {}
for r in runs:
    STRONG_LOBE[r] = get_fcontents(os.path.join(data_path,r,post_fix,"LOBE_STRONG_results.csv"))
    STRONG_LOBE_SET[r] = set()

STRONG_HSA_OBE_SET = {}
STRONG_HSA_OBE = {}
for r in runs:
    STRONG_HSA_OBE[r] = get_fcontents(os.path.join(data_path,r,post_fix,"HSA_OBE_STRONG_results.csv"))
    STRONG_HSA_OBE_SET[r] = set()

STRONG_OBE_SET = {}
STRONG_OBE = {}
for r in runs:
    STRONG_OBE[r] = get_fcontents(os.path.join(data_path,r,post_fix,"OBE_STRONG_results.csv"))
    STRONG_OBE_SET[r] = set()

STRONG_HSA_SET = {}
STRONG_HSA = {}
for r in runs:
    STRONG_HSA[r] = get_fcontents(os.path.join(data_path,r,post_fix,"HSA_STRONG_results.csv"))
    STRONG_HSA_SET[r] = set()

WEAK_FAIR_SET = {}
WEAK_FAIR = {}
for r in runs:
    WEAK_FAIR[r] = get_fcontents(os.path.join(data_path,r,post_fix,"WEAK_FAIR_results.csv"))
    WEAK_FAIR_SET[r] = set()

WEAK_LOBE_SET = {}
WEAK_LOBE = {}
for r in runs:
    WEAK_LOBE[r] = get_fcontents(os.path.join(data_path,r,post_fix,"LOBE_results.csv"))
    WEAK_LOBE_SET[r] = set()

WEAK_OBE_SET = {}
WEAK_OBE = {}
for r in runs:
    WEAK_OBE[r] = get_fcontents(os.path.join(data_path,r,post_fix,"OBE_results.csv"))
    WEAK_OBE_SET[r] = set()

WEAK_HSA_SET = {}
WEAK_HSA = {}
for r in runs:
    WEAK_HSA[r] = get_fcontents(os.path.join(data_path,r,post_fix,"HSA_results.csv"))
    WEAK_HSA_SET[r] = set()

scheduler_order = [STRONG_FAIR, STRONG_LOBE, STRONG_HSA_OBE, STRONG_OBE, STRONG_HSA, WEAK_FAIR, WEAK_LOBE, WEAK_OBE, WEAK_HSA]

scheduler_order_sets = [STRONG_FAIR_SET, STRONG_LOBE_SET, STRONG_OBE_SET, STRONG_HSA_SET, WEAK_FAIR_SET, WEAK_LOBE_SET, WEAK_OBE_SET, WEAK_HSA_SET]

def populate_strong_tests:
    for r in runs:
        num_tests = len(WEAK_HSA[r])
        for i in range(num_tests):
            s = WEAK_FAIR
            allowed = s[r][i].split(",")[1] == "P"
            if allowed:
                continue
            s = STRONG_HSA
            hsa_allowed = s[r][i].split(",")[1] == "P"
            s = STRONG_OBE
            obe_allowed = s[r][i].split(",")[1] == "P"
            #print(obe_allowed)

            s = STRONG_LOBE
            lobe_allowed = s[r][i].split(",")[1] == "P"

            if (hsa_allowed and obe_allowed and (not lobe_allowed)):
                ## theoretically not impossible, but we want to check it for our tests
                assert(0)

            if (hsa_allowed):
                STRONG_HSA_SET[r].add((r,i))
                continue

            if (obe_allowed):
                STRONG_OBE_SET[r].add((r,i))
                continue

            if (lobe_allowed):
                STRONG_LOBE_SET[r].add((r,i))
                continue
            else:
                STRONG_FAIR_SET[r].add((r,i))
                continue

# weak lines
for r in runs:
    line = r
    assert(len(scheduler_order_sets[:4]) == 4)
    for s in scheduler_order_sets[:4]:
           line += " " + str(len(s[r]))
    print(line)

total_tests = 0
total_scheds = [0 for x in range(len(scheduler_order_sets[:4]))]
for r in runs:
    line = runs_alias[r]
    assert(len(scheduler_order_sets[:4]) == 4)
    total = sum([len(x[r]) for x in scheduler_order_sets[:5]])
    total_tests += total
    x = 0
    for s in scheduler_order_sets[:4]:
        if total != 0:
            line += " " + str((len(s[r])/total)*100)
        else:
            line += " 0"
        total_scheds[x] += len(s[r])
        x += 1
    print(line)

line = "total"
for x in total_scheds:
    line += " " + str((x/total_tests)*100)
    
print(line)
print(total_scheds)

                    
