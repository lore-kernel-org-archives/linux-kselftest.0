From: keescook@chromium.org (Kees Cook)
Date: Wed, 13 Jun 2018 21:06:41 -0700
Subject: [PATCH] selftests: kselftest_harness: return Kselftest Skip code
 for skipped tests
In-Reply-To: <20180614013445.6120-1-shuah@kernel.org>
References: <20180614013445.6120-1-shuah@kernel.org>
Message-ID:
 <CAGXu5jLXAQxo7mUJThXCOMPEC3yvGU5_wLqjU_YKGtd6sFfuUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614040641.IYpvhkxF4LXICkBwx9QxDRzU2Ma_BK4Qcw7yB9hImFA@z>

On Wed, Jun 13, 2018 at 6:34 PM, Shuah Khan (Samsung OSG)
<shuah@kernel.org> wrote:
> When a test is skipped because of unmet dependencies and/or unsupported
> configuration, kselftest_harness exits with error which is treated as a
> fail by the Kselftest framework. This leads to false negative result even
> when the test could not be run.
>
> Change it to return kselftest skip code when a test gets skipped to
> clearly report that the test could not be run. This change add skip
> handling to kselftest_harness with minimal changes adding a new skipped
> field to struct __test_metadata and using it to recognize KSFT_SKIP exit
> from the test function (t->fn) to __run_test() to the test_harness_run()
> to return the right skip code to Kselftest framework.
>
> Kselftest framework SKIP code is 4 and the framework prints appropriate
> messages to indicate that the test is skipped.

Unfortunately this will not work: test step # is used as the failure
code to let test runners know where a child failed. KSFT_SKIP is 4, so
every test failing in step 4 would be seen as a skip instead of a
fail.

Tests must not exit on their own with this harness: only the existing
ASSERT/EXPECT macros can be used. uevent test should never be doing
this:

        if (geteuid()) {
                TH_LOG("Uevent filtering tests require root
privileges. Skipping test");
                _exit(KSFT_SKIP);
        }

Nor the _exit(EXIT_FAILURE) calls. Those must all be ASSERT() instead.

Perhaps a new signal could be used, but the return codes are already being used.

-Kees

>
> This change is tested on uevent test and the results are as follows:
>
> Before:
>
> TAP version 13
> selftests: uevent: uevent_filtering
> ========================================
> [==========] Running 1 tests from 1 test cases.
> [ RUN      ] global.uevent_filtering
> uevent_filtering.c:355:global.uevent_filtering:Uevent filtering tests require root privileges. Skipping test
> global.uevent_filtering: Test skipped at step #4
> [     FAIL ] global.uevent_filtering
> [==========] 0 / 1 tests passed.
> [  FAILED  ]
> not ok 1..1 selftests: uevent: uevent_filtering [FAIL]
>
> After:
>
> TAP version 13
> selftests: uevent: uevent_filtering
> ========================================
> [==========] Running 1 tests from 1 test cases.
> [ RUN      ] global.uevent_filtering
> uevent_filtering.c:355:global.uevent_filtering:Uevent filtering tests require root privileges. Skipping test
> global.uevent_filtering: Test skipped at step #4
> [     SKIP ] global.uevent_filtering
> not ok 1..1 selftests: uevent: uevent_filtering [SKIP]
>
> Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
> ---
>  tools/testing/selftests/kselftest_harness.h | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 6ae3730c4ee3..7af9ab97b367 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -631,6 +631,7 @@ struct __test_metadata {
>         void (*fn)(struct __test_metadata *);
>         int termsig;
>         int passed;
> +       int skipped;
>         int trigger; /* extra handler after the evaluation */
>         __u8 step;
>         bool no_print; /* manual trigger when TH_LOG_STREAM is not available */
> @@ -694,6 +695,7 @@ void __run_test(struct __test_metadata *t)
>         int status;
>
>         t->passed = 1;
> +       t->skipped = 0;
>         t->trigger = 0;
>         printf("[ RUN      ] %s\n", t->name);
>         child_pid = fork();
> @@ -716,9 +718,12 @@ void __run_test(struct __test_metadata *t)
>                                         t->name,
>                                         WEXITSTATUS(status));
>                         } else if (!t->passed) {
> +                               if (WEXITSTATUS(status) == KSFT_SKIP)
> +                                       t->skipped = 1;
>                                 fprintf(TH_LOG_STREAM,
> -                                       "%s: Test failed at step #%d\n",
> +                                       "%s: Test %s at step #%d\n",
>                                         t->name,
> +                                       (t->skipped ? "skipped" : "failed"),
>                                         WEXITSTATUS(status));
>                         }
>                 } else if (WIFSIGNALED(status)) {
> @@ -743,7 +748,11 @@ void __run_test(struct __test_metadata *t)
>                                 status);
>                 }
>         }
> -       printf("[     %4s ] %s\n", (t->passed ? "OK" : "FAIL"), t->name);
> +       if (t->skipped)
> +               printf("[     %4s ] %s\n", "SKIP", t->name);
> +       else
> +               printf("[     %4s ] %s\n", (t->passed ? "OK" : "FAIL"),
> +                       t->name);
>  }
>
>  static int test_harness_run(int __attribute__((unused)) argc,
> @@ -762,6 +771,8 @@ static int test_harness_run(int __attribute__((unused)) argc,
>                 __run_test(t);
>                 if (t->passed)
>                         pass_count++;
> +               else if (t->skipped)
> +                       return KSFT_SKIP;
>                 else
>                         ret = 1;
>         }
> --
> 2.17.0
>



-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
