#include <metal_stdlib>
using namespace metal;
kernel void testKernel(device atomic_uint * x, device atomic_uint * y, device atomic_int* count, uint gid_x [[thread_position_in_grid]]) {
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
