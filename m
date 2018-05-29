From: john.fastabend@gmail.com (John Fastabend)
Date: Tue, 29 May 2018 08:48:47 -0700
Subject: [PATCH bpf v2 0/5] fix test_sockmap
In-Reply-To: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <dd755be4-a298-a037-b32a-b506f45f4d8f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180529154847.5hmwXTfA8KL3kxuBlwaYlG-zySNqPZYBB8k3c1mM-zg@z>

On 05/27/2018 09:37 PM, Prashant Bhole wrote:
> This series fixes error handling, timeout and data verification in
> test_sockmap. Previously it was not able to detect failure/timeout in
> RX/TX thread because error was not notified to the main thread.
> 
> Also slightly improved test output by printing parameter values (cork,
> apply, start, end) so that parameters for all tests are displayed.
> 
> Prashant Bhole (5):
>   selftests/bpf: test_sockmap, check test failure
>   selftests/bpf: test_sockmap, join cgroup in selftest mode
>   selftests/bpf: test_sockmap, fix test timeout
>   selftests/bpf: test_sockmap, fix data verification
>   selftests/bpf: test_sockmap, print additional test options
> 
>  tools/testing/selftests/bpf/test_sockmap.c | 76 +++++++++++++++++-----
>  1 file changed, 58 insertions(+), 18 deletions(-)
> 

After first patch "check test failure" how do we handle the case
where test is known to cause timeouts because we are specifically testing
these cases. This is the 'cork' parameter we discussed in the last
series. It looks like with this series the test may still throw an
error?

Thanks,
John
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
