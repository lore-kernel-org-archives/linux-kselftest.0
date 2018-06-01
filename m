From: john.fastabend at gmail.com (John Fastabend)
Date: Fri, 1 Jun 2018 07:11:56 -0700
Subject: [PATCH bpf-next v4 3/5] selftests/bpf: test_sockmap, timing
 improvements
In-Reply-To: <20180531044240.796-4-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20180531044240.796-4-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <1f1895d0-0620-f6df-c3c3-033360bd310e@gmail.com>

On 05/30/2018 09:42 PM, Prashant Bhole wrote:
> Currently 10us delay is too low for many tests to succeed. It needs to
> be increased. Also, many corked tests are expected to hit rx timeout
> irrespective of timeout value.
> 
> - This patch sets 1000usec timeout value for corked tests because less
> than that causes broken-pipe error in tx thread. Also sets 1 second
> timeout for all other tests because less than that results in RX
> timeout
> - tests with apply=1 and higher number of iterations were taking lot
> of time. This patch reduces test run time by reducing iterations.
> 
> real    0m12.968s
> user    0m0.219s
> sys     0m14.337s
> 
> Fixes: a18fda1a62c3 ("bpf: reduce runtime of test_sockmap tests")
> Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
> ---

OK seems more reasonable to me. We could probably even go lower
on some of the 'rate' values here if needed (512->128).

Acked-by: John Fastabend <john.fastabend at gmail.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
