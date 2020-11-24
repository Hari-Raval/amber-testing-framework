//
//  main.m
//  TesterTemplate
//
//  Created by Real Tyler Sorensen  on 11/23/20.
//

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Sizes (update if running with bigger sizes)
        // assume workgroups_per_test divides total_workgroups
        //const unsigned int workgroups_per_test = 2;
        const unsigned int total_workgroups = 65532;
        const unsigned int bufferSize = (total_workgroups * sizeof(int));
        
        char *test_name = "template test";
        
        // buffers
        id<MTLBuffer> BufferX;
        id<MTLBuffer> BufferY;
        id<MTLBuffer> BufferCounter;
        
        // boiler plate (copied from tutorials)
        //id<MTLDevice> device = MTLCreateSystemDefaultDevice();
        id<MTLDevice> device = MTLCopyAllDevices()[1];
        id<MTLComputePipelineState> testKernelPSO;

        // The command queue used to pass commands to the device.
        id<MTLCommandQueue> CommandQueue;
        
        printf("running test: %s\n", test_name);
        printf("using device: %s\n", [device.name UTF8String]);
        printf("total workgroups: %u\n", total_workgroups);
        //printf("workgroups per test: %u\n", workgroups_per_test);
        printf("buffer size: %u\n", bufferSize);

        
        // More boiler plate (copied in)
        NSError* error = nil;
        
        // Load the shader files with a .metal file extension in the project
        id<MTLLibrary> defaultLibrary = [device newDefaultLibrary];
        if (defaultLibrary == nil)
        {
            printf("Failed to find the default library.");
            return -1;
        }

        id<MTLFunction> testKernel = [defaultLibrary newFunctionWithName:@"testKernel"];
        if (testKernel == nil)
        {
            printf("Failed to find the test kernel function.");
            return -1;
        }

        // Create a compute pipeline state object.
        testKernelPSO = [device newComputePipelineStateWithFunction: testKernel error:&error];
        if (testKernelPSO == nil)
        {
            //  If the Metal API validation is enabled, you can find out more information about what
            //  went wrong.  (Metal API validation is enabled by default when a debug build is run
            //  from Xcode)
            printf("Failed to created pipeline state object, error %s.", error);
            return -1;
        }

        CommandQueue = [device newCommandQueue];
        if (CommandQueue == nil)
        {
            printf("Failed to find the command queue.");
            return -1;
        }

        // allocating buffers
        BufferX = [device newBufferWithLength:bufferSize options:MTLResourceStorageModeShared];
        BufferY = [device newBufferWithLength:bufferSize options:MTLResourceStorageModeShared];
        BufferCounter = [device newBufferWithLength:bufferSize options:MTLResourceStorageModeShared];
        
        // initializing buffers
        int * initX = BufferX.contents;
        int * initY = BufferY.contents;
        int * initCounter = BufferCounter.contents;
        
        initCounter[0] = 0;
        for (int i = 0; i < total_workgroups; i++) {
            initX[i] = 0;
            initY[i] = 0;
        }
        
        id<MTLCommandBuffer> commandBuffer = [CommandQueue commandBuffer];
        assert(commandBuffer != nil);

        // Start a compute pass.
        id<MTLComputeCommandEncoder> computeEncoder = [commandBuffer computeCommandEncoder];
        assert(computeEncoder != nil);

        // Encode the pipeline state object and its parameters.
        [computeEncoder setComputePipelineState:testKernelPSO];
        [computeEncoder setBuffer:BufferX offset:0 atIndex:0];
        [computeEncoder setBuffer:BufferY offset:0 atIndex:1];
        [computeEncoder setBuffer:BufferCounter offset:0 atIndex:2];

        
        MTLSize gridSize = MTLSizeMake(total_workgroups, 1, 1);
        MTLSize threadgroupSize = MTLSizeMake(1, 1, 1);

        // Encode the compute command.
        [computeEncoder dispatchThreads:gridSize
                  threadsPerThreadgroup:threadgroupSize];

        // End the compute pass.
        [computeEncoder endEncoding];

        // Execute the command.
        [commandBuffer commit];

        // Normally, you want to do other work in your app while the GPU is running,
        // but in this example, the code simply blocks until the calculation is complete.
        [commandBuffer waitUntilCompleted];
        
        // validate the results:
        initCounter = BufferCounter.contents;
	int success = (initCounter[0] == total_workgroups);
	if (success) {
	  printf("status: passed\n");
	  return 0;
	}
	else {
	  printf("status: failed\n");
	  return -1;
	}
    }

}
