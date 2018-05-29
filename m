From: john.fastabend@gmail.com (John Fastabend)
Date: Tue, 29 May 2018 08:37:58 -0700
Subject: [PATCH bpf v2 1/5] selftests/bpf: test_sockmap, check test failure
In-Reply-To: <20180528043803.4824-2-bhole_prashant_q7@lab.ntt.co.jp>
References: <20180528043803.4824-1-bhole_prashant_q7@lab.ntt.co.jp>
 <20180528043803.4824-2-bhole_prashant_q7@lab.ntt.co.jp>
Message-ID: <78eb6956-61ac-9d18-b5f1-5edf04610a61@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180529153758.4kHp6hLgldGUxLEz37C33NHjxI5Q8m3K027PoTa9iqA@z>

On 05/27/2018 09:37 PM, Prashant Bhole wrote:
> Test failures are not identified because exit code of RX/TX threads
> is not checked. Also threads are not returning correct exit code.
> 
> - Return exit code from threads depending on test execution status
> - In main thread, check the exit code of RX/TX threads
> 
> Fixes: 16962b2404ac ("bpf: sockmap, add selftests")
> Signed-off-by: Prashant Bhole <bhole_prashant_q7 at lab.ntt.co.jp>
> ---

Acked-by: John Fastabend <john.fastabend at gmail.com>

>  tools/testing/selftests/bpf/test_sockmap.c | 25 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
> index eb17fae458e6..34feb74c95c4 100644
> --- a/tools/testing/selftests/bpf/test_sockmap.c
> +++ b/tools/testing/selftests/bpf/test_sockmap.c
> @@ -429,8 +429,8 @@ static int sendmsg_test(struct sockmap_options *opt)
>  	struct msg_stats s = {0};
>  	int iov_count = opt->iov_count;
>  	int iov_buf = opt->iov_length;
> +	int rx_status, tx_status;
>  	int cnt = opt->rate;
> -	int status;
>  
>  	errno = 0;
>  
> @@ -442,7 +442,7 @@ static int sendmsg_test(struct sockmap_options *opt)
>  	rxpid = fork();
>  	if (rxpid == 0) {
>  		if (opt->drop_expected)
> -			exit(1);
> +			exit(0);
>  
>  		if (opt->sendpage)
>  			iov_count = 1;
> @@ -463,7 +463,7 @@ static int sendmsg_test(struct sockmap_options *opt)
>  				"rx_sendmsg: TX: %zuB %fB/s %fGB/s RX: %zuB %fB/s %fGB/s\n",
>  				s.bytes_sent, sent_Bps, sent_Bps/giga,
>  				s.bytes_recvd, recvd_Bps, recvd_Bps/giga);
> -		exit(1);
> +		exit(err ? 1 : 0);
>  	} else if (rxpid == -1) {
>  		perror("msg_loop_rx: ");
>  		return errno;
> @@ -491,14 +491,27 @@ static int sendmsg_test(struct sockmap_options *opt)
>  				"tx_sendmsg: TX: %zuB %fB/s %f GB/s RX: %zuB %fB/s %fGB/s\n",
>  				s.bytes_sent, sent_Bps, sent_Bps/giga,
>  				s.bytes_recvd, recvd_Bps, recvd_Bps/giga);
> -		exit(1);
> +		exit(err ? 1 : 0);
>  	} else if (txpid == -1) {
>  		perror("msg_loop_tx: ");
>  		return errno;
>  	}
>  
> -	assert(waitpid(rxpid, &status, 0) == rxpid);
> -	assert(waitpid(txpid, &status, 0) == txpid);
> +	assert(waitpid(rxpid, &rx_status, 0) == rxpid);
> +	assert(waitpid(txpid, &tx_status, 0) == txpid);
> +	if (WIFEXITED(rx_status)) {
> +		err = WEXITSTATUS(rx_status);
> +		if (err) {
> +			fprintf(stderr, "rx thread exited with err %d. ", err);
> +			goto out;
> +		}
> +	}
> +	if (WIFEXITED(tx_status)) {
> +		err = WEXITSTATUS(tx_status);
> +		if (err)
> +			fprintf(stderr, "tx thread exited with err %d. ", err);
> +	}
> +out:
>  	return err;
>  }
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
