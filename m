From: daniel at iogearbox.net (Daniel Borkmann)
Date: Sat, 2 Jun 2018 06:16:05 +0200
Subject: [PATCH bpf-next v4 0/5] fix test_sockmap
In-Reply-To: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180531044240.796-1-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <839ad376-9719-0649-e821-e05568aa1145@iogearbox.net>

On 05/31/2018 06:42 AM, Prashant Bhole wrote:
> test_sockmap was originally written only to exercise kernel code
> paths, so there was no strict checking of errors. When the code was
> modified to run as selftests, due to lack of error handling it was not
> able to detect test failures.
> 
> In order to improve, this series fixes error handling, test run time
> and data verification.
> 
> Also slightly improved test output by printing parameter values (cork,
> apply, start, end) so that parameters for all tests are displayed.
> 
> Changes in v4:
>   - patch1: Ignore RX timoute error only for corked tests
>   - patch3: Setting different timeout for corked tests and reduce
>       run time by reducing number of iterations in some tests
> 
> Changes in v3:
>   - Skipped error checking for corked tests
> 
> Prashant Bhole (5):
>   selftests/bpf: test_sockmap, check test failure
>   selftests/bpf: test_sockmap, join cgroup in selftest mode
>   selftests/bpf: test_sockmap, timing improvements
>   selftests/bpf: test_sockmap, fix data verification
>   selftests/bpf: test_sockmap, print additional test options
> 
>  tools/testing/selftests/bpf/test_sockmap.c | 87 +++++++++++++++++-----
>  1 file changed, 67 insertions(+), 20 deletions(-)
> 

Applied to bpf-next, thanks Prashant!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
