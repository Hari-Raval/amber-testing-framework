#doesn't actually make a csv, but prints out useful data you have to copy by hand into the CSV

import os
data_path = "/Users/tylersorensen/Documents/Github/fp_repo2/Amber-Testing-Framework/Driver_and_Comparator_Results"

runs = ["2_thread_2_instruction",
        "2_thread_3_instruction",
        "2_thread_4_instruction",
        "3_thread_3_instruction",
        "3_thread_4_instruction",]

post_fix = "schedulers"

fname = "WEAK_FAIR_results.csv"

def get_fcontents(fpath):
    f = open(fpath)
    data = f.read()
    f.close()
    return data
    
total_test = 0
total_strong = 0
for r in runs:
    fpath = os.path.join(data_path,r,post_fix,fname)
    d = get_fcontents(fpath)
    num_tests = len(d.split('\n')) - 3
    last_line = d.split('\n')[-2].split(",")[1]
    print(r)
    #print(num_tests)
    print(num_tests-int(last_line),last_line)
    my_str = str(100 - (int(last_line)/(num_tests)*100)) + "," + str(int(last_line)/(num_tests)*100)
    print(my_str)
    total_test += num_tests
    total_strong += int(last_line)

my_str = str(100 - (int(total_strong)/(total_test)*100)) + "," + str(int(total_strong)/(total_test)*100)
print(my_str)

    

    


