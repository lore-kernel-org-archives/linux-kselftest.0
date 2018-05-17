From: mpe at ellerman.id.au (Michael Ellerman)
Date: Fri, 18 May 2018 00:03:51 +1000
Subject: [PATCH 2/2] selftests/powerpc: Add core file test for Protection
 Key registers
In-Reply-To: <20180223183344.21038-2-bauerman@linux.vnet.ibm.com>
References: <20180223183344.21038-1-bauerman@linux.vnet.ibm.com>
 <20180223183344.21038-2-bauerman@linux.vnet.ibm.com>
Message-ID: <87r2mamla0.fsf@concordia.ellerman.id.au>

Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com> writes:

> This test verifies that the AMR, IAMR and UAMOR are being written to a
> process' core file.
>
> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.vnet.ibm.com>
> ---
>  tools/testing/selftests/powerpc/ptrace/Makefile    |   5 +-
>  tools/testing/selftests/powerpc/ptrace/core-pkey.c | 460 +++++++++++++++++++++

Also failing w/out pkeys:

  test: core_pkey
  tags: git_version:52e7d87
  [FAIL] Test FAILED on line 117
  [FAIL] Test FAILED on line 265
  failure: core_pkey


cheers
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
