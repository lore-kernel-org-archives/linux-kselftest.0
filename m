From: urezki@gmail.com (Uladzislau Rezki)
Date: Tue, 28 May 2019 20:02:56 +0200
Subject: [PATCH] selftests: vm: install test_vmalloc.sh for run_vmtests
In-Reply-To: <20190528121809.29389-1-naresh.kamboju@linaro.org>
References: <20190528121809.29389-1-naresh.kamboju@linaro.org>
Message-ID: <20190528180256.vwp23xoz7fow6huu@pc636>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190528180256.gYRWcAJu3HOcq4YQqUWlVBVrPiWjqwgmwChTO38L4f4@z>

On Tue, May 28, 2019@01:18:09PM +0100, Naresh Kamboju wrote:
> Add test_vmalloc.sh to TEST_FILES to make sure it gets installed for
> run_vmtests.
> 
> Fixed below error:
> ./run_vmtests: line 217: ./test_vmalloc.sh: No such file or directory
> 
> Tested with: make TARGETS=vm install INSTALL_PATH=$PWD/x
> 
> Signed-off-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> ---
>  tools/testing/selftests/vm/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
> index e13eb6cc8901..05306c58ff9f 100644
> --- a/tools/testing/selftests/vm/Makefile
> +++ b/tools/testing/selftests/vm/Makefile
> @@ -25,6 +25,8 @@ TEST_GEN_FILES += virtual_address_range
>  
>  TEST_PROGS := run_vmtests
>  
> +TEST_FILES := test_vmalloc.sh
> +
>  KSFT_KHDR_INSTALL := 1
>  include ../lib.mk
>  
> -- 
> 2.17.1
> 
I missed that point during integrating with selftests.
Anyway the patch looks good to me.

Thank you for fixing it!

--
Vlad Rezki
