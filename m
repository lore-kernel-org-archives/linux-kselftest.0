From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri, 2 Mar 2018 09:31:13 +0100
Subject: [PATCH] selftests: memory-hotplug: fix emit_tests regression
In-Reply-To: <20180301201626.17347-1-shuahkh@osg.samsung.com>
References: <20180301201626.17347-1-shuahkh@osg.samsung.com>
Message-ID:
 <CADYN=9LGPa+rfnuGJ-nrpxPvw+tuAYNjxCCqefxAuRe-B_tq4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180302083113.ELCsqTzfxhRftOTGRAtHLj8Q1DDQM6U-4uFdLltAmUs@z>

On 1 March 2018@21:16, Shuah Khan <shuahkh@osg.samsung.com> wrote:
> Commit 16c513b13477
> ("selftests: memory-hotplug: silence test command echo")
>
> introduced regression in emit_tests and results in the following
> failure when selftests are installed and run. Fix it.
>
> Running tests in memory-hotplug
> ========================================
> ./run_kselftest.sh: line 121: @./mem-on-off-test.sh: No such file or
> directory
> selftests: memory-hotplug [FAIL]
>
> Fixes: 16c513b13477 (selftests: memory-hotplug: silence test command echo")
> Reported-by: Naresh Kamboju <naresh.kamboju at linaro.org>
> Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>

Tested-by: Anders Roxell <anders.roxell at linaro.org>

> ---
>  tools/testing/selftests/memory-hotplug/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/memory-hotplug/Makefile b/tools/testing/selftests/memory-hotplug/Makefile
> index 183b46883875..686da510f989 100644
> --- a/tools/testing/selftests/memory-hotplug/Makefile
> +++ b/tools/testing/selftests/memory-hotplug/Makefile
> @@ -5,7 +5,8 @@ include ../lib.mk
>
>  TEST_PROGS := mem-on-off-test.sh
>  override RUN_TESTS := @./mem-on-off-test.sh -r 2 && echo "selftests: memory-hotplug [PASS]" || echo "selftests: memory-hotplug [FAIL]"
> -override EMIT_TESTS := echo "$(RUN_TESTS)"
> +
> +override EMIT_TESTS := echo "$(subst @,,$(RUN_TESTS))"
>
>  run_full_test:
>         @/bin/bash ./mem-on-off-test.sh && echo "memory-hotplug selftests: [PASS]" || echo "memory-hotplug selftests: [FAIL]"
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
