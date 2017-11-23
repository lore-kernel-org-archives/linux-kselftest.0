From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Thu, 23 Nov 2017 21:16:52 +0000 (UTC)
Subject: [Linux-kselftest-mirror] [RFC PATCH for 4.15 v3 15/22] rseq:
 selftests: Provide self-tests
In-Reply-To: <20171122193821.GJ3165@worktop.lehotels.local>
References: <20171121141900.18471-1-mathieu.desnoyers@efficios.com>
 <20171121141900.18471-16-mathieu.desnoyers@efficios.com>
 <20171122193821.GJ3165@worktop.lehotels.local>
Message-ID: <1863234483.21251.1511471812668.JavaMail.zimbra@efficios.com>

----- On Nov 22, 2017, at 2:38 PM, Peter Zijlstra peterz at infradead.org wrote:

> On Tue, Nov 21, 2017 at 09:18:53AM -0500, Mathieu Desnoyers wrote:
>> Implements two basic tests of RSEQ functionality, and one more
>> exhaustive parameterizable test.
>> 
>> The first, "basic_test" only asserts that RSEQ works moderately
>> correctly. E.g. that the CPUID pointer works.
>> 
>> "basic_percpu_ops_test" is a slightly more "realistic" variant,
>> implementing a few simple per-cpu operations and testing their
>> correctness.
>> 
>> "param_test" is a parametrizable restartable sequences test. See
>> the "--help" output for usage.
>> 
>> A run_param_test.sh script runs many variants of the parametrizable
>> tests.
>> 
>> As part of those tests, a helper library "rseq" implements a user-space
>> API around restartable sequences. It uses the cpu_opv system call as
>> fallback when single-stepped by a debugger. It exposes the instruction
>> pointer addresses where the rseq assembly blocks begin and end, as well
>> as the associated abort instruction pointer, in the __rseq_table
>> section. This section allows debuggers may know where to place
>> breakpoints when single-stepping through assembly blocks which may be
>> aborted at any point by the kernel.
> 
> Could I ask you to split this in smaller bits?
> 
> I'd start with just the rseq library, using only the rseq interface.
> Then add the whole cpu_opv fallback stuff.
> Then add the selftests using librseq.
> 
> As is this is a tad much to read in a single go.

Sure, will do! And I plan to change the selftests to use the new
"percpu_*()" API that removes the need to duplicate code in the
caller code.

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
