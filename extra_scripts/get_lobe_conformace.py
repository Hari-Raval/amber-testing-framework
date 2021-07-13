import os
import sys
sys.path.insert(0,"../")
import amber_test_generation
#import metal_test_generation
from configuration import Configuration

sizes_alias = {"2_thread_2_instruction" : "2t_2i",
               "2_thread_3_instruction" : "2t_3i",
               "2_thread_4_instruction" : "2t_4i",
               "3_thread_3_instruction" : "3t_3i",
               "3_thread_4_instruction" : "3t_4i" ,
}

input_prefix = "../Input_Files/"
scheduler_results_prefix = "../Driver_and_Comparator_Results/"
scheduler_results_postfix = "/schedulers/LOBE_results.csv"

DIR_NAME = "LOBE_conformance"
PLAIN_TESTS = DIR_NAME + "/plain"
CHUNKED_TESTS = DIR_NAME + "/chunked"
RR_TESTS = DIR_NAME + "/round_robin"

def rm_and_mkdir(n):
    res = os.system("rm -rf " + n + "; mkdir " + n)
    assert(res == 0)

def get_data(f):
    f_handle = open(f,'r')
    data = f_handle.read()
    f_handle.close()
    return data

def get_p_tests(f):
    data = get_data(f)
    rows = data.split("\n")[1:]
    tests = [int(r.split(",")[0]) for r in rows if "P" in r]
    return tests

def mk_rr_test(finput, prefix, t):
    name = sizes_alias[prefix] + "_" + str(t)
    dir_name = RR_TESTS + "/" + name
    rm_and_mkdir(dir_name)
    chunk_rr = Configuration(timeout=2000, workgroups=65532, threads_per_workgroup=1, saturation_level=1, subgroup=0)
    os.system("cp " + finput + " " + dir_name + "/")
    amber_test_generation.generate_amber_test(finput, dir_name+"/"+name, chunk_rr)
    #metal_test_generation.generate_metal_test(finput, dir_name+"/"+name, chunk_rr)

def mk_chunked_test(finput, prefix, t):
    name = sizes_alias[prefix] + "_" + str(t)
    dir_name = CHUNKED_TESTS + "/" + name
    rm_and_mkdir(dir_name)
    chunk_cfg = Configuration(timeout=2000, workgroups=65532, threads_per_workgroup=1, saturation_level=2, subgroup=0)
    os.system("cp " + finput + " " + dir_name + "/")
    amber_test_generation.generate_amber_test(finput, dir_name+"/"+name, chunk_cfg)
    #metal_test_generation.generate_metal_test(finput, dir_name+"/"+name, chunk_cfg)

def mk_plain_test(finput, prefix, t):
    name = sizes_alias[prefix] + "_" + str(t)
    dir_name = PLAIN_TESTS + "/" + name
    rm_and_mkdir(dir_name)
    os.system("cp " + finput + " " + dir_name + "/")
    amber_test_generation.generate_amber_test(finput, dir_name+"/"+name)
    #metal_test_generation.generate_metal_test(finput, dir_name+"/"+name)

def generate_tests(prefix, tests):
    for t in tests:
        f = input_prefix + prefix + "_input_files/" + str(t) + ".txt"
        mk_plain_test(f,prefix,t)
        mk_chunked_test(f,prefix,t)
        mk_rr_test(f,prefix,t)


rm_and_mkdir(DIR_NAME)
rm_and_mkdir(PLAIN_TESTS)
rm_and_mkdir(CHUNKED_TESTS)
rm_and_mkdir(RR_TESTS)

for i in sizes_alias:
    f = scheduler_results_prefix + i + scheduler_results_postfix
    c_tests = get_p_tests(f)
    generate_tests(i,c_tests)
