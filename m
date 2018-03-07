From: shuah at kernel.org (Shuah Khan)
Date: Wed, 7 Mar 2018 12:51:06 -0700
Subject: [PATCH] selftest: net: reuseport_bpf_numa: don't fail if no numa
 support
In-Reply-To: <20180307.132500.40232199631094354.davem@davemloft.net>
References: <20180306151004.31336-1-anders.roxell@linaro.org>
 <20180307.132500.40232199631094354.davem@davemloft.net>
Message-ID: <1a84294d-babc-e4ff-1e2f-9265450fee8f@kernel.org>

On 03/07/2018 11:25 AM, David Miller wrote:
> From: Anders Roxell <anders.roxell at linaro.org>
> Date: Tue,  6 Mar 2018 16:10:04 +0100
> 
>> The reuseport_bpf_numa test case fails there's no numa support.  The
>> test shouldn't fail if there's no support it should be skipped with a
>> pass.
>>
>> Fixes: 3c2c3c16aaf6 ("reuseport, bpf: add test case for bpf_get_numa_node_id")
>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
> 
> I don't know about this.
> 
> The test did not pass.  So it should not be "skipped with a pass".
> 

You are right that "skipped with pass" is ambiguous. Don't we wish
we could have done that in college :)

> We were unable to run it at all, which means we don't know if it
> would pass or fail.  This means there is a third state besides
> pass or fail which we must acknowledge and implement.
> 

Several tests and test scripts treated test that can't be run as errors
which is also ambiguous. Test user community requested that they would
like Skips to be treated as pass. I think the reasoning is that on ARM
systems, several tests get skipped - NUMA happens to be one and there are
others. Also the configs. Not all config options might be enabled
and tests need to be skipped.

This seems to causing problems for test result analysis.

So I made a call to say - okay let's treat Skip as pass to make it easier
for analysis. Some test authors are okay with treating skip as pass. Some
test authors don't like doing so. So we are currently in an inconsistent
state. Maybe networking tests are the only ones that don't treat skip as
pass at the moment. In any case, dependency checks are made from test shell
scripts mainly and in some cases from test programs such as bpf_numa and when
dependency isn't met, some tests treat it as an error and sone as skip-pass.

Lots of test scripts check for !pass and call it fail. So changing skip as a
distinct state requires some work in several tests. Not impossible, just
effort.

Kselftest infrastructure on the other hand maintains skip count and for
tests skipped, also prints a distinct message for it. Originally skip was
treated by the framework as distinct state implying that the test can't be
run which makes more sense. Based on the request as stated above, I made
a change to map KSFT_SKIP to KSFT_PASS. Several tests use the infrastructure.

That said, I am open to adding a distinct state for skipped because can't
be run.

thanks,
-- Shuah




--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
