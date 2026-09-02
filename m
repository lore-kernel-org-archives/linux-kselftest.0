Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8D0399CE9;
	Wed,  2 Sep 2026 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392308; cv=none; b=DILdM/5Ahr0h90rbDhoaMxUiny4PlZx1PoyOQm7sr1lQ9GLWcecGYfFrkuBxfmLdRsTymASrG9Mhdbxo8z3fs1nMWm8DV6YfKW7LtO0DQBuYQTdJCs2t0+hxfLFkANWk1bySpoIewSJMzyrNohZMAowOw69m8Z2ZvteW4HzZgLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392308; c=relaxed/simple;
	bh=I9Pa8hKDS5g85UOgRYJgl+7TkogfiuEIx9cFvpLhXl4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aiB8BNmo+tKGfPxreuQi9mP1CDr3lffREM5Ceyb7oPdQN6AWatgZ3maG7yDa5Rkffk3mkq00sZGq94DmKCeRnWOcFd/BQMj1WSDARdMpzxchHNVxZyIrri38cjIaz0VgUxZipezfK4M1+ndmnuSgK2tfKH5iC6z86bbPPZ/JgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEtCNUAQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEtCNUAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D78C1F00A3A;
	Wed,  2 Sep 2026 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788392298;
	bh=pHsLzd984RzzfYVBDhPofwWlK+4V0adj0RtO8W+Zsik=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PEtCNUAQDu5QWSXmRDN7xGUSLtpF0ykA4pt9S9+uVxHneGLLriLlwborBdB48n28t
	 h+5jj8fRtCrqFcmYLj5bluZn3D8pMvO7P/JtRreeqTvhjBSlghEyAJtNl/0nsQsG3M
	 sPnjyUapgK+eaY6hKMl8Ynb6SXbvsJbrwqUJvJSg6dBdH0Qo2Sh08eX1za+V3oXL0H
	 iGE75rM5jKQfoqiwvHYMcsYiEID5/yI9mb44yb40cMPZ/OBXoWGYSaKHgonEAE/s9z
	 TQdcQCJawpnkksOLeWzOjKiogEyn5/nBOtJF0JTyV1e19jdvQ7S8SEd3Ee7TccFmM/
	 TE3kBQQydsilg==
Subject: Re: [net-next,v6,5/6] selftests: net: add multithread server support
 to iou-zcrx
From: netdev-bot+sashiko@kernel.org
To: juanlu@fastmail.com
Cc: dw@davidwei.uk, netdev@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, asml.silence@gmail.com, pabeni@redhat.com, shuah@kernel.org
Date: Wed, 02 Sep 2026 23:38:17 +0000
Message-ID: <178839229706.3394541.1555608492152892136@kernel.org>
In-Reply-To: <20260831-iou-zcrx-v6-5-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-5-02d1d012f0fd@fastmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 2 (3) · Low: 3

- [High] listen() is now executed before the workers have registered
  their zcrx ifqs, breaking the ordering that two existing in-tree tests…
- [Medium] A worker thread that is dispatched zero connections reports
  success without receiving or verifying a single byte.
- [Medium] The new CQ sizing removes the implicit bound that kept the
  zcrx refill-queue producer inside one ring.
- [Low] DISCARDED (resolved later in the series): the concern states that
  the new multithread/multi-queue server path is dead code because iou-…
- [Low] `-t` is documented as a thread count but produces its square.
- [Low] `-t 0` is accepted and yields a silent PASS.

Pre-existing issues:
- [Medium] DISCARDED (pre-existing, medium): the concern states that the
  5 s watchdog in server_worker() can never fire while the thread is…
- [Medium] DISCARDED (pre-existing, medium): the concern states that per-
  worker resources are never released — no io_uring_queue_exit(), no…
- [Medium] DISCARDED (pre-existing, medium): the concern states that
  process_recvzc() indexes the 2 MiB `payload` buffer with…

--

selftests: net: add multithread server support to iou-zcrx

This converts the iou-zcrx server into N worker threads, each owning one
RX queue with its own io_uring and zcrx ifq. The main thread keeps the
listening socket and dispatches accepted connections to workers by
matching SO_INCOMING_NAPI_ID against per-queue NAPI IDs queried over ynl.

A few questions about the new threading and setup ordering below.

> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index f793a6c04e412..29905cb3b2433 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c

[ ... ]

> @@ -97,9 +101,15 @@ struct thread_ctx {
>  	size_t			ring_size;
>  	struct io_uring_zcrx_rq	rq_ring;
>  	unsigned long		area_token;
> -	int			connfd;
> -	bool			stop;
> -	size_t			received;
> +	int			queue_id;
> +	int			napi_id;
> +	pthread_barrier_t	*setup_done;
> +	pthread_barrier_t	*dispatch_done;
> +
> +	int			connfds[MAX_CONNS_PER_THREAD];
> +	size_t			received[MAX_CONNS_PER_THREAD];
> +	int			oneshot_recvs[MAX_CONNS_PER_THREAD];
> +	int			nr_conns;
>  };

[ ... ]

> @@ -304,10 +296,10 @@ static void process_recvzc(struct thread_ctx *ctx, struct io_uring_cqe *cqe,
>  	data = (char *)ctx->area_ptr + (rcqe->off & mask);
>  
>  	for (i = 0; i < n; i++) {
> -		if (*(data + i) != payload[(ctx->received + i)])
> +		if (*(data + i) != payload[(ctx->received[conn_idx] + i)])
>  			error(1, 0, "payload mismatch at %d", i);
>  	}
> -	ctx->received += n;
> +	ctx->received[conn_idx] += n;

[Severity: Medium]
This is a pre-existing issue and not introduced by this patch, but the
index into payload[] is still unbounded. payload is a single
posix_memalign(page_size, SEND_SIZE) allocation in main(), while
ctx->received[conn_idx] only ever accumulates cqe->res, which is driven
by whatever the peer sends into the wildcard-bound listener.

Would it be worth adding a check that
ctx->received[conn_idx] + n <= cfg_send_size before the comparison loop,
so a peer sending more than cfg_send_size bytes produces a clear error
rather than an out-of-bounds read of payload[]?

>  
>  	rqe = &ctx->rq_ring.rqes[(ctx->rq_ring.rq_tail & rq_mask)];
>  	rqe->off = (rcqe->off & ~IORING_ZCRX_AREA_MASK) | ctx->area_token;

> @@ -320,28 +312,124 @@ static void server_loop(struct thread_ctx *ctx)
>  	struct io_uring_cqe *cqe;
>  	unsigned int count = 0;
>  	unsigned int head;
> -	int i, ret;
>  
>  	io_uring_submit_and_wait(&ctx->ring, 1);
>  
>  	io_uring_for_each_cqe(&ctx->ring, head, cqe) {
> -		if (cqe->user_data == 1)
> -			process_accept(ctx, cqe);
> -		else if (cqe->user_data == 2)
> -			process_recvzc(ctx, cqe);
> -		else
> -			error(1, 0, "unknown cqe");
> +		process_recvzc(ctx, cqe, cqe->user_data);
>  		count++;
>  	}
>  	io_uring_cq_advance(&ctx->ring, count);
>  }
>  
> -static void run_server(void)
> +static void *server_worker(void *arg)
>  {
> -	struct thread_ctx ctx = {};
> -	unsigned int flags = 0;
> -	int fd, enable, ret;
> +	struct io_uring_params params = { };
> +	struct thread_ctx *ctx = arg;
>  	uint64_t tstop;
> +	int i;
> +
> +	params.flags |= IORING_SETUP_COOP_TASKRUN;
> +	params.flags |= IORING_SETUP_SINGLE_ISSUER;
> +	params.flags |= IORING_SETUP_DEFER_TASKRUN;
> +	params.flags |= IORING_SETUP_SUBMIT_ALL;
> +	params.flags |= IORING_SETUP_CQE32;
> +	params.flags |= IORING_SETUP_CQSIZE;
> +	params.cq_entries = AREA_SIZE / page_size;

[Severity: Medium]
Can this overrun the zcrx refill ring? The CQ is now sized to
AREA_SIZE / page_size (8192 entries), while setup_zcrx() still uses
rq_entries = 4096.

server_loop() drains every available CQE in one batch, and
process_recvzc() publishes exactly one refill descriptor per CQE without
ever consulting khead:

	rqe = &ctx->rq_ring.rqes[(ctx->rq_ring.rq_tail & rq_mask)];
	...
	io_uring_smp_store_release(ctx->rq_ring.ktail, ++ctx->rq_ring.rq_tail);

Previously io_uring_queue_init(512, ...) gave cq_entries = 1024, which is
strictly smaller than rq_entries, so a single drain could not wrap the
refill ring. With 8192 CQ entries a drain of more than 4096 zcrx CQEs
overwrites descriptors that the kernel has not consumed yet, and the
kernel side clamps rather than complains:

io_uring/zcrx.c:__zcrx_rq_entries() {
	u32 entries = rq->cached_tail - rq->cached_head;

	return min(entries, rq->nr_entries);
}

so the surplus buffers are simply never returned to the page pool. Should
the producer only publish while (ktail - khead) < rq_entries, or should
rq_entries be at least cq_entries?

> +
> +	io_uring_queue_init_params(512, &ctx->ring, &params);
> +	setup_zcrx(ctx);
> +
> +	if (cfg_dry_run)
> +		return NULL;
> +
> +	pthread_barrier_wait(ctx->setup_done);
> +	pthread_barrier_wait(ctx->dispatch_done);
> +
> +	for (i = 0; i < ctx->nr_conns; i++) {
> +		if (cfg_oneshot) {
> +			ctx->oneshot_recvs[i] = cfg_oneshot_recvs;
> +			add_recvzc_oneshot(ctx, i, page_size);
> +		} else {
> +			add_recvzc(ctx, i);
> +		}
> +	}
> +
> +	tstop = gettimeofday_ms() + 5000;
> +	while (ctx->nr_conns > 0 && gettimeofday_ms() < tstop)
> +		server_loop(ctx);
> +
> +	if (ctx->nr_conns != 0)
> +		error(1, 0, "test failed: %d connections incomplete",
> +		      ctx->nr_conns);

[Severity: Medium]
Can a worker that received no connections at all report success here?
nr_conns is used both as the dispatch count and as the live-connection
countdown, so with nr_conns == 0 the arming loop above does nothing, the
drain loop is skipped, and this final check passes without a single byte
having been received or verified.

Dispatch in run_server() is purely SO_INCOMING_NAPI_ID based, and nothing
guarantees a non-empty distribution. With -t 2 (total_conns = 4) all four
flows can hash onto one RSS queue, in which case the second worker exits
successfully having done nothing, and the multi-queue test reports pass
while only one queue was exercised. The previous code failed loudly in
this situation with "test failed".

Would a post-dispatch assertion in run_server() that every worker owns at
least one connection, plus a check on the received byte totals, keep the
old strictness?

The reverse skew looks unhandled too: total_conns is cfg_num_threads
squared, and if they all land on one worker then for -t 9 and above this
trips the "worker %d connection overflow" error in run_server(), which
would be a spurious failure rather than a real one.

[Severity: Medium]
This isn't a bug introduced by this patch, but the 5 s deadline can still
never fire while the thread is parked inside server_loop():

	io_uring_submit_and_wait(&ctx->ring, 1);

The deadline is only re-evaluated between blocking waits, so a stalled
connection hangs the worker (and then pthread_join() in run_server())
instead of producing the "connections incomplete" failure. The same shape
existed before the patch, but it now applies per worker thread. Could the
wait use a timeout so the watchdog is effective?

> +
> +	return NULL;
> +}

[ ... ]

> +static void run_server(void)
> +{
> +	pthread_barrier_t setup_done, dispatch_done;
> +	int total_conns, accepted = 0, connfd;
> +	struct thread_ctx *ctxs;
> +	int fd, ret, enable, i;
> +	unsigned int ifindex;
> +	pthread_t *threads;
> +
> +	ctxs = calloc(cfg_num_threads, sizeof(*ctxs));
> +	threads = calloc(cfg_num_threads, sizeof(*threads));
> +	if (!ctxs || !threads)
> +		error(1, 0, "calloc()");

[Severity: Low]
Should parse_opts() reject -t 0? cfg_num_threads is taken straight from
strtoul(optarg, NULL, 0) with no positivity check, and with 0:

  - calloc(0, ...) returns a non-NULL pointer, so this guard passes
  - both barriers are initialised with a single participant
  - no workers are created
  - total_conns is 0, so the accept loop never runs
  - both barrier waits return immediately and run_server() returns 0

The client side also computes total_conns as cfg_num_threads squared, so
it makes no connection and exits successfully as well. Either way the
binary reports success without doing any work.

>  
>  	fd = socket(AF_INET6, SOCK_STREAM, 0);
>  	if (fd == -1)

> @@ -356,29 +444,68 @@ static void run_server(void)
>  	if (ret < 0)
>  		error(1, 0, "bind()");
>  
> -	flags |= IORING_SETUP_COOP_TASKRUN;
> -	flags |= IORING_SETUP_SINGLE_ISSUER;
> -	flags |= IORING_SETUP_DEFER_TASKRUN;
> -	flags |= IORING_SETUP_SUBMIT_ALL;
> -	flags |= IORING_SETUP_CQE32;
> +	pthread_barrier_init(&setup_done, NULL, cfg_num_threads + 1);
> +	pthread_barrier_init(&dispatch_done, NULL, cfg_num_threads + 1);
> +
> +	for (i = 0; i < cfg_num_threads; i++) {
> +		ctxs[i].queue_id = cfg_queue_id + i;
> +		ctxs[i].setup_done = &setup_done;
> +		ctxs[i].dispatch_done = &dispatch_done;
> +	}
>  
> -	io_uring_queue_init(512, &ctx.ring, flags);
> +	for (i = 0; i < cfg_num_threads; i++) {
> +		ret = pthread_create(&threads[i], NULL,
> +				     server_worker, &ctxs[i]);
> +		if (ret)
> +			error(1, ret, "pthread_create()");
> +	}
>  
> -	setup_zcrx(&ctx);
>  	if (cfg_dry_run)
> -		return;
> +		goto join;
>  
>  	if (listen(fd, 1024) < 0)
>  		error(1, 0, "listen()");
>  
> -	add_accept(&ctx, fd);
> +	pthread_barrier_wait(&setup_done);

[Severity: High]
Is the listen() intentionally moved before the workers have registered
their ifqs? The main thread creates the threads, calls listen(), and only
then waits on setup_done, while the workers reach that barrier after
io_uring_queue_init_params() plus setup_zcrx(), i.e. after
io_uring_register_ifq() has restarted the device RX queue.

Before the patch the sequence was serialized in one thread:

	io_uring_queue_init(512, &ctx.ring, flags);
	setup_zcrx(&ctx);
	...
	listen(fd, 1024);

so the port only became visible once the memory provider was installed.

Two existing tests depend on that ordering. wait_port_listen() in
net/lib/py/utils.py polls every 5 ms, so it can now return while
registration is still in flight:

iou-zcrx.py:test_zcrx_large_chunks() {
	wait_port_listen(cfg.port, proto="tcp")

	check_iou_rx_buf_len(cfg, rx_buf_len)
}

check_iou_rx_buf_len() raises "Expected 1 io-uring page pool, found 0",
and nk_qlease.py:test_destroy() does queue_get() plus
ksft_in("io-uring", queue_info) immediately after wait_port_listen() with
no sleep.

Beyond the harness races, data delivered into the queue before the
provider exists is serviced by the copy fallback rather than zero copy,
and the queue restart during registration can drop in-flight frames.

Would moving listen() below pthread_barrier_wait(&setup_done) restore the
previous guarantee?

>  
> -	tstop = gettimeofday_ms() + 5000;
> -	while (!ctx.stop && gettimeofday_ms() < tstop)
> -		server_loop(&ctx);
> +	if (cfg_num_threads > 1) {
> +		ifindex = if_nametoindex(cfg_ifname);
> +		if (!ifindex)
> +			error(1, 0, "bad interface name: %s", cfg_ifname);
> +		for (i = 0; i < cfg_num_threads; i++)
> +			ctxs[i].napi_id = query_napi_id(ifindex,
> +							ctxs[i].queue_id);
> +	}
> +
> +	total_conns = cfg_num_threads * cfg_num_threads;

[Severity: Low]
This isn't a bug, but -t is documented as a thread count while both
run_server() and run_client() square it. usage() advertises
-t<num_threads>, and run_client() creates total_conns threads with
total_conns = cfg_num_threads * cfg_num_threads, so -t 8 produces 64
client threads and 64 connections, not 8. That also interacts with the
64-entry MAX_CONNS_PER_THREAD limit. Could the option name or the usage
text spell out the quadratic connection count?

> +
> +	while (accepted < total_conns) {
> +		int idx = 0;
> +
> +		connfd = accept(fd, NULL, NULL);
> +		if (connfd < 0)
> +			error(1, errno, "accept()");
>  
> -	if (!ctx.stop)
> -		error(1, 0, "test failed\n");
> +		if (cfg_num_threads > 1)
> +			idx = find_thread_by_conn(ctxs, connfd);
> +
> +		if (ctxs[idx].nr_conns >= MAX_CONNS_PER_THREAD)
> +			error(1, 0, "worker %d connection overflow", idx);
> +		ctxs[idx].connfds[ctxs[idx].nr_conns++] = connfd;
> +		accepted++;
> +	}
> +
> +	pthread_barrier_wait(&dispatch_done);
> +
> +join:
> +	for (i = 0; i < cfg_num_threads; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	pthread_barrier_destroy(&setup_done);
> +	pthread_barrier_destroy(&dispatch_done);
> +	close(fd);
> +	free(threads);
> +	free(ctxs);

[Severity: Medium]
This is a pre-existing gap rather than something the patch introduces,
but the teardown is now asymmetric. The barriers, the listening fd and
the two calloc'ed arrays are released here, while the per-worker
resources are not: there is no io_uring_queue_exit(), no munmap() of the
AREA_SIZE zero-copy area or of the refill ring mapping created in
setup_zcrx(), and the accepted connfds stored in ctxs[idx].connfds[] are
never closed. With cfg_num_threads workers this is now multiplied by the
thread count, including on the cfg_dry_run early return in
server_worker(). Would it be worth adding the matching cleanup?

>  }
>  
>  static void *client_worker(void *arg)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831-iou-zcrx-v6-0-02d1d012f0fd%40fastmail.com
