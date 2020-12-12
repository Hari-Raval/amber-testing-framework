

#include <metal_stdlib>
using namespace metal;




kernel void plain_2t_2i_3(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_2i_5(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_2i_6(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_2i_3(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_2i_5(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_2i_6(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_2i_3(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_2i_5(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_2i_6(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_4(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_9(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_12(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_14(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_17(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_18(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_19(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_22(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_42(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_47(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_50(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_56(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_60(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_62(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_63(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_72(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_81(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_87(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_89(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_90(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_91(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_101(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_103(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_105(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_108(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_112(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_116(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_123(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_124(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_126(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_128(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_131(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_132(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_136(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_142(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_146(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_148(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_149(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_151(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_157(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_158(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_159(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_160(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_161(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_166(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_167(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_168(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_3i_175(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_4(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_9(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_12(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_14(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_17(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_18(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_19(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_22(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_42(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_47(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_50(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_56(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_60(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_62(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_63(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_72(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_81(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_87(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_89(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_90(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_91(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_101(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_103(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_105(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_108(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_112(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_116(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_123(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_124(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_126(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_128(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_131(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_132(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_136(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_142(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_146(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_148(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_149(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_151(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_157(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_158(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_159(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_160(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_161(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_166(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_167(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_168(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_3i_175(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_4(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_9(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_12(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_14(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_17(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_18(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_19(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_22(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_42(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_47(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_50(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_56(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_60(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_62(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_63(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_72(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_81(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_87(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_89(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_90(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_91(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_101(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_103(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_105(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_108(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_112(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_116(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_123(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_124(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_126(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_128(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_131(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_132(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_136(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_142(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_146(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_148(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_149(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_151(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_157(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_158(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_159(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_160(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_161(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_166(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_167(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_168(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_3i_175(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_28(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_30(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_48(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_60(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_71(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_75(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_76(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_79(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_81(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_84(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_87(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_99(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_102(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_107(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(y, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(y, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_113(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_116(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_117(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_118(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_119(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_120(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_122(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_124(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_126(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_133(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_134(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_137(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_139(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_155(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(y, 1, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(y, 0, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_156(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_159(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_2t_4i_161(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_28(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_30(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_48(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_60(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_71(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_75(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_76(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_79(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_81(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_84(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_87(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_99(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_102(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_107(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(y + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(y + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_113(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_116(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_117(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_118(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_119(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_120(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_122(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_124(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_126(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_133(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_134(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_137(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_139(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_155(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(y + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(y + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_156(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_159(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_2t_4i_161(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_28(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_30(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_48(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_60(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_71(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_75(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_76(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_79(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_81(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_84(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_87(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_99(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_102(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_107(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(y + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(y + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_113(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_116(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_117(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_118(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_119(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_120(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_122(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_124(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_126(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 0, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_133(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_134(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_137(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_139(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_155(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(y + index, 1, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(y + index, 0, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_156(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 3;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 3:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_159(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin2t_4i_161(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 2;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_3i_3(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_3i_7(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_3i_11(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_3i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_3i_16(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_3i_18(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_3i_20(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_3i_3(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_3i_7(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_3i_11(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_3i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_3i_16(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_3i_18(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_3i_20(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_3i_3(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_3i_7(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_3i_11(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_3i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_3i_16(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_3i_18(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_3i_20(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_4(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_10(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_14(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_29(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_30(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_31(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_34(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_36(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_38(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_48(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_52(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_55(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_56(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_61(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_64(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_66(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_72(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_80(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_82(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_84(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x, 1, memory_order_relaxed) == 1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_86(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_91(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_92(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_93(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_94(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_95(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x, 0, memory_order_relaxed) == 0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_99(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void plain_3t_4i_100(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    if (gid_x == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_4(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_10(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_14(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_29(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_30(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_31(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_34(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_36(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_38(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_48(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_52(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_55(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_56(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_61(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_64(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_66(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_72(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_80(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_82(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_84(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_86(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_91(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_92(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_93(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_94(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_95(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_99(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void chunked_3t_4i_100(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    int chunk_size =  total_num_threads / num_testing_threads;
    uint index = gid_x % chunk_size;

    if (gid_x / chunk_size == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x / chunk_size == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_4(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_10(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_13(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_14(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_29(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_30(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_31(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_34(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_36(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_38(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_46(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_48(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_52(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_55(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_56(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_61(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 1 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_64(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_66(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_72(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_80(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_82(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_84(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_exchange_explicit(x + index, 1, memory_order_relaxed) ==  1) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_86(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_91(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_92(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_93(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_94(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_95(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_exchange_explicit(x + index, 0, memory_order_relaxed) ==  0) {
           pc = 2;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_99(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}



kernel void round_robin3t_4i_100(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
    int pc = 0;

    int total_num_threads = 65532;
    int num_testing_threads = 3;
    uint index = gid_x / num_testing_threads;

    if (gid_x % num_testing_threads == 0) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(x + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 1) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        atomic_exchange_explicit(y + index, 1, memory_order_relaxed);
        pc = pc + 1;
        break;

      case 1:
        terminate = 1;
        break;

         }
       }
    }

    if (gid_x % num_testing_threads == 2) {
       int terminate = 0;

    while (true) {
       if (terminate == 1) {
       break;
    }
    switch(pc) {

      case 0:
        if (atomic_fetch_add_explicit(x+index, 0, memory_order_relaxed) == 0 ) {
           pc = 0;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 1:
        if (atomic_fetch_add_explicit(y+index, 0, memory_order_relaxed) == 0 ) {
           pc = 1;
        }
        else {
           pc = pc + 1;
        }
        break;

      case 2:
        terminate = 1;
        break;

         }
       }
    }

    atomic_fetch_add_explicit(count, 1, memory_order_relaxed);
}


