for r in runs:
    num_tests = len(WEAK_HSA[r])
    for i in range(num_tests):
        pdb.set_trace()
        for x in range(5,len(scheduler_order)):
            s = scheduler_order[x]
            allowed = s[r][i].split(",")[1] == "P"
            if allowed and x in [8,7]:
                scheduler_order_sets[x][r].add((i,r))
                continue
            if not allowed:
                if x == 5:
                    break
                if x == 7:
                    continue
                    
                assert(x-1 >= 5)
                s2 = scheduler_order[x - 1]
                allowed2 = s2[r][i].split(",")[1] == "P"
                if allowed2:
                    scheduler_order_sets[x-1][r].add((i,r))
                    break
                else:
                    assert(x-2 >= 5)
                    s3 = scheduler_order[x - 2]
                    allowed3 = s3[r][i].split(",")[1] == "P"
                    scheduler_order_sets[x-2][r].add((i,r))
                    assert(allowed3)
                    break
