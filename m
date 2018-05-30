From: john.fastabend at gmail.com (John Fastabend)
Date: Wed, 30 May 2018 06:32:36 -0700
Subject: [PATCH bpf v3 0/5] fix test_sockmap
In-Reply-To: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <a5c50b8e-92fa-cb94-8495-1c0dbe0bfb9f@gmail.com>

On 05/29/2018 10:56 PM, Prashant Bhole wrote:
> This series fixes error handling, timeout and data verification in
> test_sockmap. Previously it was not able to detect failure/timeout in
> RX/TX thread because error was not notified to the main thread.
> 
> Also slightly improved test output by printing parameter values (cork,
> apply, start, end) so that parameters for all tests are displayed.
> 
> Changes in v3:
>   - Skipped error checking for corked tests
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

Looks good thanks. We may want to tune the running time a bit but
lets get this applied first. A lot of nice improvements!

.John
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
