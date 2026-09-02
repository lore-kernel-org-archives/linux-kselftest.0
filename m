Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B82C447806;
	Wed,  2 Sep 2026 23:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392307; cv=none; b=SqmOgYImbp8bXPCf5JaxeMx9IO78dsa0gM0Zw5iOBhwEe/2ly2Bc96z3C7/qkmwdnudXu6IedujXumLCqEujCtTyJRxCVp8a9xkuNgl08vbOfbaGJt6C5iIycSlKXW8kXbsntlzU3jij5HYpDxRoW3CHMr1pykkbYkHAUP3T7mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392307; c=relaxed/simple;
	bh=otUZDvyAeLzQsNWVLrYBtMp4x6LSRysKAy9YyToYMNk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mj3EPf7/tFlC3s6mwXkf44rpFTqDoodLz6kBqbo1j0SUHmKbSPWxWVmVHhUkYa0aMetK/JwNafEZv9sr8aJ/jLA0UTlYjlraeaqa4+2CGv3P7HJBDEZ/KcovtEFCMSv8o58zWEMOag73LRHCuTAHDEcQAZsnhsONDOuP9LX1/kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/UHAkh0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/UHAkh0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2301F00A3D;
	Wed,  2 Sep 2026 23:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788392299;
	bh=eA6UZcEke4BRMvjhH28yoLWbv+Q1kGEr2M2qJEghAKg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D/UHAkh0/1XyWVaILdgjuRCjydMFeMvm86x44a1IWoUXodJMhodhTXGBu+JLND21Z
	 +Ua2d7CZAsx9DuyVmdcF0J76bomVYdoqnKw9kxKK8AbKDKDdf5tU/vVc6R+w7CpwPd
	 7vxL6dmFUDHIzGzwODpRtDDFlqxpzCUIX/gzBjLF045quuA/HUrr5mcrpRtShHG5Rn
	 BKnijLWWMh22s6WLb5eH5/X+nWacPZ75CcvGaBV/tWMlo4xNUIBjvaOarV6vhhlLzu
	 7PnaG6sSFny9TSYYjVJKqjQbTLEPCL1hK1Ge3lNPn+vxGirVMA982j/HHuJQ5hd6SX
	 /CvdaKYECtBNA==
Subject: Re: [net-next,v6,6/6] selftests: net: add rss_multiqueue test variant
 to iou-zcrx
From: netdev-bot+sashiko@kernel.org
To: juanlu@fastmail.com
Cc: dw@davidwei.uk, netdev@vger.kernel.org, io-uring@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, asml.silence@gmail.com, pabeni@redhat.com, shuah@kernel.org
Date: Wed, 02 Sep 2026 23:38:18 +0000
Message-ID: <178839229826.3394541.7285066966620333885@kernel.org>
In-Reply-To: <20260831-iou-zcrx-v6-6-02d1d012f0fd@fastmail.com>
References: <20260831-iou-zcrx-v6-6-02d1d012f0fd@fastmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 2 · Low: 0

- [Medium] `rss_multiqueue()` in
  tools/testing/selftests/drivers/net/hw/iou-zcrx.py claims to "exercise…
- [Medium] The readiness handshake used by the Python driver no longer
  implies that the receiver is armed.

--

selftests: net: add rss_multiqueue test variant to iou-zcrx

Adds a new rss_multiqueue variant to the iou-zcrx Python test which builds
a two-queue RSS context, steers the tcp6 flow into it, and runs the
iou-zcrx helper with two receive threads. The existing test_zcrx variants
now also pass an explicit thread count of one.

> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> index b7a225fe4beae..c833535d8a03c 100755
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> @@ -30,6 +30,13 @@ def create_rss_ctx(cfg):
>      return int(values)
>  
>  
> +def create_rss_ctx_multi(cfg, start, count):
> +    """Create an RSS context spanning count queues from start, return its ID."""
> +    output = ethtool(f"-X {cfg.ifname} context new start {start} equal {count}").stdout
> +    values = re.search(r'New RSS context is (\d+)', output).group(1)
> +    return int(values)
> +
> +

[ ... ]

> @@ -127,17 +134,56 @@ def _require_ntuple(cfg):
>          defer(ethtool, f"-K {cfg.ifname} ntuple-filters off")
>  
>  
> +def rss_multiqueue(cfg):
> +    """Steer the test flow to a multi-queue RSS context for multi-thread zcrx."""

[ ... ]

> +    cfg.num_threads = 2
> +    cfg.target = channels - cfg.num_threads
> +    ethtool(f"-X {cfg.ifname} equal {cfg.target}")
> +    defer(ethtool, f"-X {cfg.ifname} default")
> +
> +    rss_ctx_id = create_rss_ctx_multi(cfg, cfg.target, cfg.num_threads)
> +    defer(ethtool, f"-X {cfg.ifname} delete context {rss_ctx_id}")
> +
> +    flow_rule_id = set_flow_rule_rss(cfg, rss_ctx_id)
> +    defer(ethtool, f"-N {cfg.ifname} delete {flow_rule_id}")

[Severity: Medium]

Can this variant report a pass when only one of the two queues carried
zcrx traffic?

The RSS context spans queues [cfg.target, cfg.target + 1] and the flow rule
matches only flow-type tcp6 dst-port, so all connections share the same
addresses and destination port. The variant never configures or checks
ethtool -n rx-flow-hash tcp6, so on a device whose tcp6 hash covers only
addresses, every connection lands on the same queue. Even with a full
4-tuple hash, the four flows over a two-entry indirection table all collide
on a single queue roughly one run in eight.

On the helper side, run_server() distributes accepted connections purely by
the hardware-selected napi id:

tools/testing/selftests/drivers/net/hw/iou-zcrx.c:run_server() {
	total_conns = cfg_num_threads * cfg_num_threads;
	while (accepted < total_conns) {
		int idx = 0;
		connfd = accept(fd, NULL, NULL);
		...
		if (cfg_num_threads > 1)
			idx = find_thread_by_conn(ctxs, connfd);
	...
}

and a worker that ends up with no connections exits successfully:

tools/testing/selftests/drivers/net/hw/iou-zcrx.c:server_worker() {
	...
	while (ctx->nr_conns > 0 && gettimeofday_ms() < tstop)
		server_loop(ctx);

	if (ctx->nr_conns != 0)
		error(1, 0, "test failed: %d connections incomplete",
		      ctx->nr_conns);
	...
}

With nr_conns == 0 the loop and the check are both skipped, the process
exits 0, and rss_multiqueue passes while behaving exactly like the existing
single-queue rss variant.

Would it make sense to require L4 tcp6 hashing, fail when a worker in
multi-thread mode gets zero connections or zero bytes, and/or verify
io-uring page pool activity for both cfg.target and cfg.target + 1 from
Python? check_iou_rx_buf_len() and cfg.netnl.page_pool_get() already give
the per-queue view needed for the last part.

>  @ksft_variants([
>      KsftNamedVariant("single", single),
>      KsftNamedVariant("rss", rss),
> +    KsftNamedVariant("rss_multiqueue", rss_multiqueue),
>  ])
>  def test_zcrx(cfg, setup) -> None:
>      cfg.require_ipver('6')
>      _require_ntuple(cfg)
>  
> +    cfg.num_threads = 1
> +
>      setup(cfg)
> -    rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target}"
> -    tx_cmd = f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} -l 12840"
> +
> +    rx_cmd = (f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} "
> +              f"-q {cfg.target} -t {cfg.num_threads}")
> +    tx_cmd = (f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} "
> +              f"-l 12840 -t {cfg.num_threads}")
>      with bkg(rx_cmd, exit_wait=True):
>          wait_port_listen(cfg.port, proto="tcp")
>          cmd(tx_cmd, host=cfg.remote)

[Severity: Medium]

Does wait_port_listen() still mean the receiver is armed once every
test_zcrx variant goes through the threaded server path?

wait_port_listen() in tools/testing/selftests/net/lib/py/utils.py only
polls /proc/net/tcp for TCP state 0A (LISTEN). In the threaded server the
listen() now happens before the setup barrier:

tools/testing/selftests/drivers/net/hw/iou-zcrx.c:run_server() {
	...
	/* pthread_create() loop for the workers */
	...
	if (listen(fd, 1024) < 0)
		error(1, 0, "listen()");

	pthread_barrier_wait(&setup_done);
	...
}

while the worker only reaches that barrier after the 32 MB mmap and
io_uring_register_ifq() done by setup_zcrx():

tools/testing/selftests/drivers/net/hw/iou-zcrx.c:server_worker() {
	io_uring_queue_init_params(512, &ctx->ring, &params);
	setup_zcrx(ctx);

	if (cfg_dry_run)
		return NULL;

	pthread_barrier_wait(ctx->setup_done);
	...
}

So the port is observable as LISTEN while the zcrx ifq is not yet
registered, and cmd(tx_cmd, host=cfg.remote) can start streaming into that
window.

Two consequences seem possible. Bytes arriving before
io_uring_register_ifq() land in ordinary driver pages and
io_zcrx_recv_frag() falls back to io_zcrx_copy_frag(), so the payload check
still succeeds while the zero-copy path is not exercised.

Also, test_zcrx_large_chunks() calls check_iou_rx_buf_len() right after
wait_port_listen(), which raises when the pool is not there yet:

tools/testing/selftests/drivers/net/hw/iou-zcrx.py:check_iou_rx_buf_len() {
    ...
    if len(pools) != 1:
        raise Exception(f"Expected 1 io-uring page pool, found {len(pools)}")
    ...
}

Would moving listen(fd, 1024) to after pthread_barrier_wait(&setup_done)
restore the previous ordering, where the port only became observable once
zcrx registration had completed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831-iou-zcrx-v6-0-02d1d012f0fd%40fastmail.com
