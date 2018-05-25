From: bauerman@linux.ibm.com (Thiago Jung Bauermann)
Date: Thu, 24 May 2018 23:14:27 -0300
Subject: [PATCH 1/2] selftests/powerpc: Add ptrace tests for Protection
 Key registers
In-Reply-To: <87tvr6mlbe.fsf@concordia.ellerman.id.au>
References: <20180223183344.21038-1-bauerman@linux.vnet.ibm.com>
 <87tvr6mlbe.fsf@concordia.ellerman.id.au>
Message-ID: <874liwqy64.fsf@morokweng.localdomain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180525021427.ExbZE1NDHYOjwPap9kgKlitDQHXN4QfLFnuHR-1ItCw@z>


Michael Ellerman <mpe at ellerman.id.au> writes:

> Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com> writes:
>
>> This test exercises read and write access to the AMR, IAMR and UAMOR.
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com>
>> ---
>>  tools/testing/selftests/powerpc/include/reg.h      |   1 +
>>  tools/testing/selftests/powerpc/ptrace/Makefile    |   5 +-
>>  tools/testing/selftests/powerpc/ptrace/child.h     | 130 ++++++++
>>  .../testing/selftests/powerpc/ptrace/ptrace-pkey.c | 326 +++++++++++++++++++++
>
> This is failing on machines without pkeys:
>
>   test: ptrace_pkey
>   tags: git_version:52e7d87
>   [FAIL] Test FAILED on line 117
>   [FAIL] Test FAILED on line 191
>   failure: ptrace_pkey
>
>
> I think the first fail is in the child here:
>
> int ptrace_read_regs(pid_t child, unsigned long type, unsigned long regs[],
> 		     int n)
> {
> 	struct iovec iov;
> 	long ret;
>
> 	FAIL_IF(start_trace(child));
>
> 	iov.iov_base = regs;
> 	iov.iov_len = n * sizeof(unsigned long);
>
> 	ret = ptrace(PTRACE_GETREGSET, child, type, &iov);
> 	FAIL_IF(ret != 0);
>
>
> Which makes sense.

Yes, that is indeed what is going on.

> The test needs to skip if pkeys are not available/enabled. Using the
> availability of the REGSET might actually be a nice way to detect that,
> because it's read-only.

 I forgot to consider the case of pkeys not available or not enabled,
 sorry about that.

I just sent a v2 which implements your suggestion above.

--
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
