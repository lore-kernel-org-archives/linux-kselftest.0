From: john.fastabend at gmail.com (John Fastabend)
Date: Wed, 30 May 2018 06:31:08 -0700
Subject: [PATCH bpf v3 3/5] selftests/bpf: test_sockmap, fix test timeout
In-Reply-To: <20180530055611.10216-4-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20180530055611.10216-4-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <5fdb7801-496e-81fb-dd34-c255a5290384@gmail.com>

On 05/29/2018 10:56 PM, Prashant Bhole wrote:
> In order to reduce runtime of tests, recently timout for select() call
> was reduced from 1sec to 10usec. This was causing many tests failures.
> It was caught with failure handling commits in this series.
> 
> Restoring the timeout from 10usec to 1sec
> 
> Fixes: a18fda1a62c3 ("bpf: reduce runtime of test_sockmap tests")
> Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
> ---

Quick question, how long does it take to run now with the time increase?
If its taking too long we may need to remove some tests. I have a longer
running test_sockmap script that I run as part of Cilium[1] project
where I put longer running stress tests.

Acked-by: John Fastabend <john.fastabend at gmail.com>

[1] cilium.io
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
