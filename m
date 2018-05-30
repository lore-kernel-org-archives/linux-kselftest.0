From: john.fastabend at gmail.com (John Fastabend)
Date: Wed, 30 May 2018 06:26:44 -0700
Subject: [PATCH bpf v3 1/5] selftests/bpf: test_sockmap, check test failure
In-Reply-To: <20180530055611.10216-2-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20180530055611.10216-2-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <544b1334-813e-d02e-3539-fa5905a42238@gmail.com>

On 05/29/2018 10:56 PM, Prashant Bhole wrote:
> Test failures are not identified because exit code of RX/TX threads
> is not checked. Also threads are not returning correct exit code.
> 
> - Return exit code from threads depending on test execution status
> - In main thread, check the exit code of RX/TX threads
> - Skip error checking for corked tests as they are expected to timeout
> 
> Fixes: 16962b2404ac ("bpf: sockmap, add selftests")
> Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
> ---
>  tools/testing/selftests/bpf/test_sockmap.c | 25 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 

Looks good. Thanks.

Acked-by: John Fastabend <john.fastabend at gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
