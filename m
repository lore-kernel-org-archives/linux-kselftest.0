Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3243F8D7;
	Wed,  2 Sep 2026 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392306; cv=none; b=rnNxL13FaCSNIYrqtqAOybR/NSl6XPqgRGHm0Bb/wasOMip/yWc9wjhWn4mDfAPXHydVRX5AwoinlFPpAr2t4QEGx8DzKrs5xXxp8oXTAnblYajUrDOXhIJjVmPT6bOjSq9q6mQQLj2/nusHBiYk7ZrafrIQ60uOGmF88MrgQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392306; c=relaxed/simple;
	bh=3gEZG7ZyjjTaRhEhht1pVtnGcwv4aePP9Nw7+rrR+eA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gzJLBMAZiOhsGaBcLRL2btTpR0tpJ1QWCyySkgNjaHqjysAJTX7s1NDrpSpdXduqWcd/z2HOXnXrCAoW15c1r43aCQm8/rRwODKLIiaADt0IlF5WIPGABiPygBu2U67SQhuBzput+IG3zd/GZvIuhBptdGXwEdDYZ88zyP3Xz4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7begmVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7begmVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAF91F000E9;
	Wed,  2 Sep 2026 23:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788392296;
	bh=9y7HvndFoQNLpPcVQzwylt2nEHOL61PE4Kqk8A9XuNg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=C7begmVa2yJ3fFp2/Mm6+fGI4jv9et0W1GApkBMvnPPZHv1+ssVDsEHYcJwZT6qMk
	 ZnAper7jBIAxVwkOpPHFhzcPNcmTCAmcnMNaYRUWznAn2Wvi8GWEjfpCNMTjkUXPHc
	 KMZVfK1W5RZjO3ofdtmoU53ntVdBKtUuTQezz8b6llS4KyKdxsJQYKkDNi2dKaPXWg
	 hKEMrHefPu01wdBdkZkxM3LXVDvh4RNwc6s59rRMUH2JK3jNtksYwoFZix+hx9bLJg
	 5OUY3QkUQe2wFZQcCSWPXmiPj6IoKb5EO46ZJ3mXoD/hO/+tJsbco1Nt6FNIEzh+vy
	 IosYCEYC5qGaA==
Subject: Re: [net-next,v6,4/6] selftests: net: add multithread client support
 to iou-zcrx
From: netdev-bot+sashiko@kernel.org
To: juanlu@fastmail.com
Cc: dw@davidwei.uk, netdev@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, asml.silence@gmail.com, pabeni@redhat.com, shuah@kernel.org
Date: Wed, 02 Sep 2026 23:38:15 +0000
Message-ID: <178839229576.3394541.5652719733200698350@kernel.org>
In-Reply-To: <20260831-iou-zcrx-v6-4-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-4-02d1d012f0fd@fastmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 (1) · Low: 2

- [Medium] run_client() creates cfg_num_threads * cfg_num_threads worker
  threads/TCP connections instead of cfg_num_threads, contradicting both…
- [Medium] At this commit the multi-connection client has no counterpart
  on the receive side of the same binary: run_server() (iou-zcrx.c:339)…
- [Low] The new -t option is parsed with strtoul() into the signed int
  cfg_num_threads (iou-zcrx.c:499) with no syntax, range, or non-zero…
- [Low] At this commit no case in iou-zcrx.py (the only in-tree consumer
  of the iou-zcrx binary) passes -t, so the newly added multithreaded…

Pre-existing issues:
- [Medium] client_worker() (iou-zcrx.c:384) walks `payload[sent]` for
  cfg_send_size bytes, but payload is allocated with a fixed size of…

--

selftests: net: add multithread client support to iou-zcrx

This adds pthreads to the iou-zcrx client so several connections can be
made at once, and a new -t option to pick how many threads are used
(default 1).  The Makefile now links iou-zcrx against -lpthread.

A few questions about the new client code below.

> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index 9b62fd0703e61..f793a6c04e412 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c

[ ... ]

> @@ -85,6 +86,7 @@ static int cfg_send_size = SEND_SIZE;
>  static struct sockaddr_in6 cfg_addr;
>  static unsigned int cfg_rx_buf_len;
>  static bool cfg_dry_run;
> +static int cfg_num_threads = 1;
>  
>  static char *payload;
>  
> @@ -379,7 +381,7 @@ static void run_server(void)
>  		error(1, 0, "test failed\n");
>  }
>  
> -static void run_client(void)
> +static void *client_worker(void *arg)
>  {
>  	ssize_t to_send = cfg_send_size;
>  	ssize_t sent = 0;

[Severity: Medium]
This is a pre-existing issue and is not introduced by this patch, since the
code was only renamed from run_client() to client_worker() here, but can
client_worker() read past the end of payload[]?

payload is allocated with a fixed size in main():

	if (posix_memalign((void **)&payload, page_size, SEND_SIZE))

while the loop in client_worker() walks cfg_send_size bytes:

	ssize_t to_send = cfg_send_size;
	...
	while (to_send) {
		void *src = &payload[sent];

		chunk = min_t(ssize_t, cfg_payload_len, to_send);
		res = send(fd, src, chunk, 0);

and cfg_send_size comes straight from -z with no comparison against
SEND_SIZE:

		case 'z':
			cfg_send_size = strtoul(optarg, NULL, 0);

With -z larger than SEND_SIZE (512 * 4096), does &payload[sent] end up past
the allocation, and are those out-of-bounds bytes then handed to send()?
process_recvzc() looks to have the mirror-image indexing on
payload[ctx->received + i].  No in-tree caller currently passes such a
value (iou-zcrx.py uses -z 16384), and this patch only increases the number
of threads that would perform the same read.

> @@ -405,12 +407,36 @@ static void run_client(void)
>  	}
>  
>  	close(fd);
> +	return NULL;
> +}
> +
> +static void run_client(void)
> +{
> +	int total_conns = cfg_num_threads * cfg_num_threads;
                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Is squaring the thread count here intentional?  The changelog says:

    Introduce the -t option to control the number of threads (default 1)

and the usage string added by this patch says -t<num_threads>, but
total_conns is cfg_num_threads * cfg_num_threads and is then used as the
calloc() element count and as the bound of both the pthread_create() and
pthread_join() loops in run_client().

So -t 2 gives 4 threads and 4 connections, -t 4 gives 16, and -t 8 gives
64; only the default of 1 matches the documented meaning.  Each worker
opens its own socket, so thread stacks and file descriptors also grow
quadratically with a value the help text presents as a plain thread count.

There is no comment explaining the squaring, and the later server patch in
this series treats -t as a literal thread/queue count:

	ctxs = calloc(cfg_num_threads, sizeof(*ctxs));
	...
	pthread_barrier_init(&setup_done, NULL, cfg_num_threads + 1);

At the end of the series (4a6d87a68298) run_client() still has
total_conns = cfg_num_threads * cfg_num_threads and the usage string still
reads -t<num_threads>, so the two halves of the same option keep disagreeing.
Could the squaring be dropped, or the option documented as the per-side
value it actually is?

> +	pthread_t *threads;
> +	int i, ret;
> +
> +	threads = calloc(total_conns, sizeof(*threads));
> +	if (!threads)
> +		error(1, 0, "calloc()");
> +
> +	for (i = 0; i < total_conns; i++) {
> +		ret = pthread_create(&threads[i], NULL, client_worker, NULL);
> +		if (ret)
> +			error(1, ret, "pthread_create()");
> +	}

[Severity: Medium]
At this commit, can the server side of the same binary service more than
one of these connections?

run_server() builds a single struct thread_ctx and posts exactly one accept:

	add_accept(&ctx, fd);

and process_accept() aborts on the second completion:

	if (ctx->connfd)
		error(1, 0, "Unexpected second connection");

Verification also uses a single ctx->received cursor into the global
payload, which only tracks one stream.  With -t greater than 1, do the
extra connections sit in the backlog while the server exits on the first
stream's EOF, leaving the remaining client_worker() threads to fail in
send() or block until the server timeout?

The receive side gains multi-connection support in the next patch of this
series ("selftests: net: add multithread server support to iou-zcrx"),
where run_server() spawns cfg_num_threads workers, accepts until
accepted < total_conns, dispatches each connfd into ctxs[idx].connfds[],
and drops the "Unexpected second connection" abort.  Would it be worth
ordering the server patch first so the tree is never in a state where
-t > 1 cannot complete?

> +
> +	for (i = 0; i < total_conns; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	free(threads);
>  }

[Severity: Low]
This isn't a bug, but at this commit no case in iou-zcrx.py passes -t, so
the new pthread_create()/pthread_join() loops in run_client() only ever run
with the default cfg_num_threads == 1 and the multithreaded path is not
exercised by the shipped suite.  Coverage arrives later in the series: at
4a6d87a68298 test_zcrx builds both command lines with -t {cfg.num_threads},
and the rss_multiqueue variant sets cfg.num_threads = 2.

>  
>  static void usage(const char *filepath)
>  {
>  	error(1, 0, "Usage: %s (-4|-6) (-s|-c) -h<server_ip> -p<port> "
> -		    "-l<payload_size> -i<ifname> -q<rxq_id>", filepath);
> +		    "-l<payload_size> -i<ifname> -q<rxq_id> -t<num_threads>",
> +		    filepath);
>  }

[ ... ]

> @@ -469,6 +495,9 @@ static void parse_opts(int argc, char **argv)
>  		case 'd':
>  			cfg_dry_run = true;
>  			break;
> +		case 't':
> +			cfg_num_threads = strtoul(optarg, NULL, 0);
> +			break;

[Severity: Low]
This isn't a bug, but -t is stored with strtoul() into the signed int
cfg_num_threads with no non-zero or range check, and run_client() then
evaluates cfg_num_threads * cfg_num_threads in int arithmetic before using
it as a calloc() count and loop bound.

-t 0 and -t 65536 (65536 * 65536 wraps to 0 in int) both create no threads
and let the client exit successfully without sending anything, -t 4294967295
narrows to -1, values at or above 46341 overflow the signed multiplication,
and -t 1000 asks for a million threads.

Note the rest of the file parses its numeric options the same unvalidated
way (-p, -l, -q, -o, -z, -x), so a small sanity check on -t alone would
still be an improvement if the squaring stays.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831-iou-zcrx-v6-0-02d1d012f0fd%40fastmail.com
