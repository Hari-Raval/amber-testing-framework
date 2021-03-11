import sys
import re
import pdb
import os.path

#res_path = "/Users/tylersorensen/Documents/Github/fp_repo2/Amber-Testing-Framework/Driver_and_Comparator_Results"
res_path = "/home/tsorensen/github/Amber-Testing-Framework_ssh/Amber-Testing-Framework/Driver_and_Comparator_Results"

VENDOR = "CUDA"

# Pass in the input log
assert(len(sys.argv) == 2)
fname = sys.argv[1]

def get_file_contents(fname):
    f = open(fname)
    data = f.read()
    f.close()
    return data

raw_data = get_file_contents(fname)

dname = fname.split("/")[-1].replace(".txt","")
print(dname)


tests = raw_data.split("Running ")[1:]
print(tests[0])

def get_hueristic(t):
    if "chunked" in t:
        return "chunked"
    if "round_robin" in t:
        return "round_robin"
    if "plain" in t:
        return "plain"
    assert(0)

def get_run(t):
    if "2t_2i" in t:
        return "2t_2i"
    if "2t_3i" in t:
        return "2t_3i"
    if "2t_4i" in t:
        return "2t_4i"
    if "3t_3i" in t:
        return "3t_3i"
    if "3t_4i" in t:
        return "3t_4i"
    assert(0)

def get_killed_success(t):
    #pdb.set_trace()
    #print(t)
    k = re.search("killed: (\d+)",t)[1]
    s = re.search("Success: (\d+)",t)[1]
    return k,s

def get_id(t):
    first_line = t.split("\n")[0]
    to_return = first_line.split("_")[-1]
    #print(to_return)
    return to_return 

results = {"3t_4i" : [],
           "3t_3i" : [],
           "2t_2i" : [],
           "2t_3i" : [],
           "2t_4i" : []}

result_map = {"3t_4i" : "3_thread_4_instruction",
           "3t_3i" : "3_thread_3_instruction",
           "2t_2i" : "2_thread_2_instruction",
           "2t_3i" : "2_thread_3_instruction",
           "2t_4i" : "2_thread_4_instruction"}


runs = set()
    
for t in tests:
    h = get_hueristic(t)
    r = get_run(t)
    i = get_id(t)
    runs.add(r)
    k,s = get_killed_success(t)
    results[r].append((i,h,k,s))

def get_entry(i, d, h):
    for e in d:
        if e[0] == str(i) and e[1] == h:
            k = int(e[2])
            s = int(e[3])
            total = k + s
            if s == total:
                return "P",0
            else:
                return "F (" + str(k) + "/" + str(total) + ")",k

    assert(0)
            

for r in runs:
    csv = ["Test File Name,No saturation Result,Round Robin Saturation Result,Chunking Saturation Result,All Passed"]

    total_e = 0
    total_rr = 0
    total_c = 0
    total_ap = 0
    #if (r == '3t_3i'):
    #    pdb.set_trace()
    for i in range(len(results[r])):
        name = str(i)
        e,t = get_entry(i, results[r], "plain")
        total_e += t
        
        #rr,t = get_entry(i, results[r], "round_robin")
        rr = "P"
        total_rr += 0
        
        #c,t = get_entry(i, results[r], "chunked")
        c = "P"
        total_c += 0

        ap = "F"
        total_ap += 1
        if e == "P":
            ap = "P"
            total_ap -= 1
        line = ",".join([name,e,rr,c, ap])
        csv.append(line)
    sum_line = "Total failures:,"+ ",".join([str(total_e), str(total_rr), str(total_c), str(total_ap)])
    csv.append(sum_line)

    #if r == '3t_3i':
    #    pdb.set_trace()
    fname = dname + ".csv"
    fname = os.path.join(res_path, result_map[r], VENDOR, fname)
    print(fname)
    f = open(fname,'w')
    f.write("\n".join(csv))
    f.close()
