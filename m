From: john.fastabend at gmail.com (John Fastabend)
Date: Fri, 1 Jun 2018 07:04:40 -0700
Subject: [PATCH bpf-next v4 1/5] selftests/bpf: test_sockmap, check test
 failure
In-Reply-To: <20180531044240.796-2-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20180531044240.796-2-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <0bc10468-cee4-978d-9f7b-10463a8506ba@gmail.com>

On 05/30/2018 09:42 PM, Prashant Bhole wrote:
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


Acked-by: John Fastabend <john.fastabend at gmail.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
