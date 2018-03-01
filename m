From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Thu, 1 Mar 2018 14:41:06 +0530
Subject: [PATCH] selftests: memory-hotplug: silence test command echo
In-Reply-To: <20180213214407.21717-1-shuahkh@osg.samsung.com>
References: <20180213214407.21717-1-shuahkh@osg.samsung.com>
Message-ID: <CA+G9fYsE0w00aeE3jxJU3Q01Yz_C95zn+kguMHqg6M9PRmhemg@mail.gmail.com>

On 14 February 2018 at 03:14, Shuah Khan <shuahkh at osg.samsung.com> wrote:
> Silence the following command being printed while running test.
>
> ./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" ||
> echo "selftests: memory-hotplug [FAIL]"
>
> Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
> ---
>  tools/testing/selftests/memory-hotplug/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/memory-hotplug/Makefile b/tools/testing/selftests/memory-hotplug/Makefile
> index 86636d207adf..183b46883875 100644
> --- a/tools/testing/selftests/memory-hotplug/Makefile
> +++ b/tools/testing/selftests/memory-hotplug/Makefile
> @@ -4,7 +4,7 @@ all:
>  include ../lib.mk
>
>  TEST_PROGS := mem-on-off-test.sh
> -override RUN_TESTS := ./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
> +override RUN_TESTS := @./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
>  override EMIT_TESTS := echo "$(RUN_TESTS)"
>
>  run_full_test:

The test execution broken due to this patch ?

Running tests in memory-hotplug
========================================
./run_kselftest.sh: line 121: @./mem-on-off-test.sh: No such file or directory
selftests: memory-hotplug [FAIL]

LAVA job id:
https://lkft.validation.linaro.org/scheduler/job/132699#L2526

- Naresh

> --
> 2.14.1
>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
