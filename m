From: shuah@kernel.org (Shuah Khan)
Date: Thu, 14 Jun 2018 10:02:15 -0600
Subject: [PATCH] selftests: kselftest_harness: return Kselftest Skip code
 for skipped tests
In-Reply-To: <CAGXu5jLXAQxo7mUJThXCOMPEC3yvGU5_wLqjU_YKGtd6sFfuUw@mail.gmail.com>
References: <20180614013445.6120-1-shuah@kernel.org>
 <CAGXu5jLXAQxo7mUJThXCOMPEC3yvGU5_wLqjU_YKGtd6sFfuUw@mail.gmail.com>
Message-ID: <dd086a7d-36fe-b6f5-3257-c30898cc8a34@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614160215.xZUrEiiGtzDPrehjXfVCUosNX6-dCXJVMfcsfMddDKM@z>

On 06/13/2018 10:06 PM, Kees Cook wrote:
> On Wed, Jun 13, 2018 at 6:34 PM, Shuah Khan (Samsung OSG)
> <shuah@kernel.org> wrote:
>> When a test is skipped because of unmet dependencies and/or unsupported
>> configuration, kselftest_harness exits with error which is treated as a
>> fail by the Kselftest framework. This leads to false negative result even
>> when the test could not be run.
>>
>> Change it to return kselftest skip code when a test gets skipped to
>> clearly report that the test could not be run. This change add skip
>> handling to kselftest_harness with minimal changes adding a new skipped
>> field to struct __test_metadata and using it to recognize KSFT_SKIP exit
>> from the test function (t->fn) to __run_test() to the test_harness_run()
>> to return the right skip code to Kselftest framework.
>>
>> Kselftest framework SKIP code is 4 and the framework prints appropriate
>> messages to indicate that the test is skipped.
> 
> Unfortunately this will not work: test step # is used as the failure
> code to let test runners know where a child failed. KSFT_SKIP is 4, so
> every test failing in step 4 would be seen as a skip instead of a
> fail.
> 

Yeah. That is correct. __bail() does exit with step which could be step #4

> Tests must not exit on their own with this harness: only the existing
> ASSERT/EXPECT macros can be used. uevent test should never be doing
> this:
> 
>         if (geteuid()) {
>                 TH_LOG("Uevent filtering tests require root
> privileges. Skipping test");
>                 _exit(KSFT_SKIP);
>         }
> 
> Nor the _exit(EXIT_FAILURE) calls. Those must all be ASSERT() instead.

It did look like an improper use of the harness by this test. Okay that
makes sense.

> 
> Perhaps a new signal could be used, but the return codes are already being used.
> 

A a new harness hook for KSFT_SKIP case so tests can call that explicitly would
solve the problem once the problem of conflict with step #4.

Since he harness step metadata doesn't have special meaning than keeping track of
how far test ran, harness could be changed to treat step #4 as a special value and
not use it for step to solve the conflict between ksft and kselftest_harness.

thanks,
-- Shuah






--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
