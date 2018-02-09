From: daniel@iogearbox.net (Daniel Borkmann)
Date: Fri, 9 Feb 2018 15:01:57 +0100
Subject: [Linux-kselftest-mirror] [Resend] Question: kselftests:
	bpf/test_maps failed
In-Reply-To: <747824f6-4877-69fe-9f1d-f3c18fed6a01@intel.com>
References: <747824f6-4877-69fe-9f1d-f3c18fed6a01@intel.com>
Message-ID: <40e0d564-cacb-7608-423e-eb85f5343521@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180209140157.JB6P63R3KzgD2HIGlNYaUkIHPW4o2AhNohOr4mKufBE@z>

On 02/09/2018 06:14 AM, Li Zhijian wrote:
> Hi
> 
> INTEL 0-Day noticed that bpf/test_maps has different results at different platforms.
> when it fails, the details are like

Sorry for the late reply and thanks for reporting! More below:

> ------------------
>   880 Failed to create hashmap key=16 value=131072 'Cannot allocate memory'
>   881 Failed to create hashmap key=8 value=32768 'Cannot allocate memory'
>   882 Failed to create hashmap key=8 value=131072 'Cannot allocate memory'
>   883 Failed to create hashmap key=16 value=32768 'Cannot allocate memory'
>   884 Failed to create hashmap key=8 value=16384 'Cannot allocate memory'
>   885 Failed to create hashmap key=16 value=16384 'Cannot allocate memory'
>   886 Failed to create hashmap key=8 value=65536 'Cannot allocate memory'
>   887 Failed to create hashmap key=16 value=131072 'Cannot allocate memory'
>   888 Failed to create hashmap key=16 value=32768 'Cannot allocate memory'
>   889 Failed to create hashmap key=16 value=65536 'Cannot allocate memory'
>   890 Failed to create hashmap key=8 value=65536 'Cannot allocate memory'
>   891 Failed to create hashmap key=8 value=131072 'Cannot allocate memory'
>   892 Failed to create hashmap key=8 value=131072 'Cannot allocate memory'
>   893 Failed to create hashmap key=16 value=32768 'Cannot allocate memory'
>   894 Failed to create hashmap key=8 value=16384 'Cannot allocate memory'
>   895 Failed to create hashmap key=8 value=131072 'Cannot allocate memory'
>   896 Failed to create hashmap key=16 value=8192 'Cannot allocate memory'
>   897 Failed to create hashmap key=8 value=32768 'Cannot allocate memory'
>   898 Failed to create hashmap key=16 value=8192 'Cannot allocate memory'
>   899 Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
>   900 Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
>   901 Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
>   902 Failed to create hashmap key=16 value=262144 'Cannot allocate memory'
>   903 Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
>   904 Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
>   905 test_maps: test_maps.c:955: run_parallel: Assertion `status == 0' failed.
>   906 Aborted
>   907 not ok 1..3 selftests:  test_maps [FAIL]
> ------------------
> 
> After a simply looking at the code, looks it's related to the cpu number and system memory.
> 
> below are the result under different platform
> 1. Good
> model: Sandy Bridge
> nr_node: 1
> nr_cpu: 4
> memory: 6G
> 
> 2. Good
> model: qemu-system-x86_64 -enable-kvm
> nr_cpu: 2
> memory: 4G
> 
> 3. Bad
> model: Ivytown Ivy Bridge-EP
> nr_cpu: 48
> memory: 64G
> 
> 4. Bad
> model: Skylake
> nr_cpu: 104
> memory: 64G
> 
> I try to change the process number to 10 from 100, so it can pass at above Skylake(4) machine.
> ------------
> lizhijian at haswell-OptiPlex-9020:~/lkp/linux/tools/testing/selftests/bpf$ git diff
> diff --git a/tools/testing/selftests/bpf/test_maps.c b/tools/testing/selftests/bpf/test_maps.c
> index 040356e..b788ca1 100644
> --- a/tools/testing/selftests/bpf/test_maps.c
> +++ b/tools/testing/selftests/bpf/test_maps.c
> @@ -960,7 +960,7 @@ static void test_map_stress(void)
>  {
>         run_parallel(100, test_hashmap, NULL);
>         run_parallel(100, test_hashmap_percpu, NULL);
> -       run_parallel(100, test_hashmap_sizes, NULL);
> +       run_parallel(10, test_hashmap_sizes, NULL);
>         run_parallel(100, test_hashmap_walk, NULL);
>  
>         run_parallel(100, test_arraymap, NULL);

Unless Alexei has some better idea, I think if the bpf_create_map() error in
the stress test is about ENOMEM, then we shouldn't fail hard via exit(), for
all other cases we should however. So probably makes sense to just check for
errno == ENOMEM in case of fd < 0 in test_hashmap_sizes() and then continue
to keep trying under stress. Feel free to send a patch, Li.

Thanks again,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
