
/*
__device__ void plain_2t_2i_2(uint * x, uint * y, uint* count) {
	int pc = 0;
	int tid = blockIdx.x * blockDim.x + threadIdx.x;
	int total_num_threads = gridDim.x * blockDim.x;

	if (tid == 0) { 
	   int terminate = 0;

	while (true) {
	   if (terminate == 1) {
	   break;
	}
	switch(pc) {

	  case 0: 
		if (atomicExch(x,0) == 0) { 
		   pc = 0;
		}
		else {
		   pc = pc + 1;
		}
		break;

	  case 1:
		terminate = 1;
		break;

	     }
	   }
	}

	if (tid == 1) { 
	   int terminate = 0;

	while (true) {
	   if (terminate == 1) {
	   break;
	}
	switch(pc) {

	  case 0: 
		if (atomicExch(x,1) == 0) { 
		   pc = 0;
		}
		else {
		   pc = pc + 1;
		}
		break;

	  case 1:
		terminate = 1;
		break;

	     }
	   }
	}

	atomicAdd(count, 1);
	}*/

__device__ void lock(uint *x) {
  while (atomicExch(x,1) == 0);
  
}

__device__ void unlock(uint *x) {
  atomicExch(x,0);
  
}


__device__ void plain_2t_2i_2(uint * x, uint * y, uint* count) {
  int pc = 0;
  int tid = blockIdx.x * blockDim.x + threadIdx.x;
  int total_num_threads = gridDim.x * blockDim.x;
  
  if (tid == 0) {
    while (atomicAdd(x,0) == 0) {
    }
  }
  
  if (tid == 1) {
    atomicAdd(x,1);
  }

  //  lock(x);
  //  unlock(x);
  
  atomicAdd(count, 1);
}

__device__ tfunc plain_2t_2i_2_ptr = plain_2t_2i_2;
__global__ void test_launcher_kernel(uint * x, uint * y, uint* count, tfunc f) {
  f(x,y,count);
}
