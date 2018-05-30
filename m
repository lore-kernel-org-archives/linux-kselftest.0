From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Wed, 30 May 2018 15:29:43 -0400
Subject: [PATCH bpf v3 3/5] selftests/bpf: test_sockmap, fix test timeout
In-Reply-To: <20180530055611.10216-4-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180530055611.10216-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20180530055611.10216-4-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <20180530192942.4ahcaxupbhfkopl4@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180530192943.oXaF-NP428Glz8glz0rZvdRA5RDknZ0qLyW-80p3wWM@z>

On Wed, May 30, 2018@02:56:09PM +0900, Prashant Bhole wrote:
> In order to reduce runtime of tests, recently timout for select() call
> was reduced from 1sec to 10usec. This was causing many tests failures.
> It was caught with failure handling commits in this series.
> 
> Restoring the timeout from 10usec to 1sec
> 
> Fixes: a18fda1a62c3 ("bpf: reduce runtime of test_sockmap tests")
> Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
> ---
>  tools/testing/selftests/bpf/test_sockmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
> index 64f9e25c451f..9d01f5c2abe2 100644
> --- a/tools/testing/selftests/bpf/test_sockmap.c
> +++ b/tools/testing/selftests/bpf/test_sockmap.c
> @@ -345,8 +345,8 @@ static int msg_loop(int fd, int iov_count, int iov_length, int cnt,
>  		if (err < 0)
>  			perror("recv start time: ");
>  		while (s->bytes_recvd < total_bytes) {
> -			timeout.tv_sec = 0;
> -			timeout.tv_usec = 10;
> +			timeout.tv_sec = 1;
> +			timeout.tv_usec = 0;

I've applied the set, but had to revert it, since it takes too long.

real	1m40.124s
user	0m0.375s
sys	0m14.521s

Myself and Daniel run the test semi-manually when we apply patches.
Adding 2 extra minutes of wait time is unnecessary.
Especially since most of it is idle time.
Please find a way to fix tests differently.
btw I don't see any failures today. Not sure what is being fixed
by incresing a timeout.

Also please mention [PATCH bpf-next] in the subject when you respin.
Thanks!

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
