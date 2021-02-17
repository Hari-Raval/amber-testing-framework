import os
import sys
sys.path.insert(0,"../../")
import amber_test_generation
import metal_test_generation
import cpp_test_generation
from configuration import Configuration
import pdb

sizes_alias = {"2_thread_2_instruction" : "2t_2i",
               "2_thread_3_instruction" : "2t_3i",
               "2_thread_4_instruction" : "2t_4i",
               "3_thread_3_instruction" : "3t_3i",
               "3_thread_4_instruction" : "3t_4i" ,
}

input_prefix = "../../Input_Files/"
scheduler_results_prefix = "../../Driver_and_Comparator_Results/"
scheduler_results_postfix = "/schedulers/LOBE_results.csv"

DIR_NAME = "ALL_tests"
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
    tests = [int(r.split(",")[0]) for r in rows if "P" in r or "F" in r]
    return tests

def mk_rr_test(finput, prefix, t):
    name = sizes_alias[prefix] + "_" + str(t)
    dir_name = RR_TESTS + "/" + name
    rm_and_mkdir(dir_name)
    chunk_rr = Configuration(timeout=2000, workgroups=65532, threads_per_workgroup=1, saturation_level=1, subgroup=0)
    os.system("cp " + finput + " " + dir_name + "/")
    #amber_test_generation.generate_amber_test(finput, dir_name+"/"+name, chunk_rr)
    #cpp_test_generation.generate_cpp_test(finput, dir_name+"/"+name, chunk_rr)
    metal_test_generation.generate_metal_test(finput, dir_name+"/"+name, chunk_rr)
    return get_data(dir_name+"/"+name + ".metal")

def mk_chunked_test(finput, prefix, t):
    name = sizes_alias[prefix] + "_" + str(t)
    dir_name = CHUNKED_TESTS + "/" + name
    rm_and_mkdir(dir_name)
    chunk_cfg = Configuration(timeout=2000, workgroups=65532, threads_per_workgroup=1, saturation_level=2, subgroup=0)
    os.system("cp " + finput + " " + dir_name + "/")
    #amber_test_generation.generate_amber_test(finput, dir_name+"/"+name, chunk_cfg)
    #cpp_test_generation.generate_cpp_test(finput, dir_name+"/"+name, chunk_cfg)
    metal_test_generation.generate_metal_test(finput, dir_name+"/"+name, chunk_cfg)
    return get_data(dir_name+"/"+name + ".metal")

def mk_plain_test(finput, prefix, t):
    name = sizes_alias[prefix] + "_" + str(t)
    dir_name = PLAIN_TESTS + "/" + name
    rm_and_mkdir(dir_name)
    os.system("cp " + finput + " " + dir_name + "/")
    #amber_test_generation.generate_amber_test(finput, dir_name+"/"+name)
    #cpp_test_generation.generate_cpp_test(finput, dir_name+"/"+name)
    metal_test_generation.generate_metal_test(finput, dir_name+"/"+name)
    return get_data(dir_name+"/"+name + ".metal")

def generate_tests(prefix, tests):
    plain_names = []
    plain_kernels = []
    chunked_names = []
    chunked_kernels = []
    rr_names = []
    rr_kernels = []
    for t in tests:
        plain_names.append("plain_" + sizes_alias[prefix] + "_" + str(t))
        chunked_names.append("chunked_" + sizes_alias[prefix] + "_" + str(t))
        rr_names.append("round_robin" + sizes_alias[prefix] + "_" + str(t))

        f = input_prefix + prefix + "_input_files/" + str(t) + ".txt"
        plain_kernels.append(mk_plain_test(f,prefix,t))
        chunked_kernels.append(mk_chunked_test(f,prefix,t))
        rr_kernels.append(mk_rr_test(f,prefix,t))

    return plain_names,plain_kernels,chunked_names,chunked_kernels,rr_names,rr_kernels

rm_and_mkdir(DIR_NAME)
rm_and_mkdir(PLAIN_TESTS)
rm_and_mkdir(CHUNKED_TESTS)
rm_and_mkdir(RR_TESTS)
header = """
"""
kernels = [header]
for i in sizes_alias:
    f = scheduler_results_prefix + i + scheduler_results_postfix
    c_tests = get_p_tests(f)
    #print(c_tests)
    plain_names, plain_kernels, chunked_names, chunked_kernels, rr_names, rr_kernels = generate_tests(i,c_tests)
    uplain_kernels = []
    uchunked_kernels = []
    urr_kernels = []
    for i in range(len(plain_names)):
        k = plain_kernels[i]
        k = k.replace("testKernel", plain_names[i])
        if (i != 0):
            k = k.replace("#include <metal_stdlib>","")
            k = k.replace("using namespace metal;","")            
        uplain_kernels.append(k)

        k = chunked_kernels[i]
        k = k.replace("testKernel", chunked_names[i])
        k = k.replace("#include <metal_stdlib>","")
        k = k.replace("using namespace metal;","")
        uchunked_kernels.append(k)
        
        k = rr_kernels[i]        
        k = k.replace("testKernel", rr_names[i])
        k = k.replace("#include <metal_stdlib>","")
        k = k.replace("using namespace metal;","")
        urr_kernels.append(k)


    kernels = kernels + uplain_kernels + uchunked_kernels + urr_kernels

print("\n".join(kernels))
