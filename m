Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81748BD26;
	Fri, 11 Sep 2026 18:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150624; cv=none; b=e6oR13mlvJv1ehrjbH+SFUDshAYLZEh938mSKO3+of6i4/01lpMVR0wyBW5xTdzBTXFnjEDmHDEQkpNYioW7h9wwxZIpgV5AyqgTU9OBg7C2R7E3cZFUg4puxSvw8GeVN+d1lLZ02SSXA8GYEqZttTFLcVninY9v30xCVQxSe2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150624; c=relaxed/simple;
	bh=k5uSf2dNts7e5vsZyyzqBVgEnBWscvWs8HccNNL80OI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kLoJAFvzl0aUvMqGLMozN5ODFGcL4SWV+h/f2jFV4EX+c7tmpcI3CGqJi2O5svGGDbXPGZ5zP8eupiuezUGPdBpMCCxC9W44UGb+nRPqxwCw2lkEvWyG6thgpE9INCDTNXeanIIC2lTU8plRGDx7NzC9WiPMO6ikUhTv+wkzGJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsCitqDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsCitqDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E65D1F00898;
	Fri, 11 Sep 2026 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789150613;
	bh=jaXGq5qUGBG8UH/2bm3XnpBY1/FrawintgqnWIzo0gc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JsCitqDTiq1dkYFfnOOQFBG3/Fp/h7jMnOseHgDhCGozOAQKCkQYu3xFJOwpoYu0K
	 s57yboG5tIX9+391bOI/t1zte+w3JrzbNXFGMQl9wb4G3hXU940nGvRCn9rtabC2t3
	 MhMLU3cxL3DPxOQcRfw1+42SeC+CYURHClfkuuoEQeEce0tnY/vsjavE8YvFeVO7aP
	 WxIzbwCQWGdOB6YLVDsFFHx03pvJEVXIUruGquBX4yYXEi9VaoM9eY/8xpco/p8rUL
	 JJOe38Ulse2XUpJDQSAYAflIazzZUxo4h0qNJHYmF3uJVUIoGvt4ls1zA8PccZaSKN
	 t70Ara3mntAjw==
Subject:
 Re: [PATCH net-next v2 5/5] selftests: drv-net: Test large zcrx buffers
From: netdev-bot+sashiko@kernel.org
To: bjorn@kernel.org
Cc: alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 daniel@iogearbox.net, mike.marciniszyn@gmail.com, mohsin.bashr@gmail.com,
 sdf@fomichev.me, bobbyeshleman@meta.com, daskald@meta.com,
 bestswngs@gmail.com, maxime.chevallier@bootlin.com, jacob.e.keller@intel.com,
 leitao@debian.org, cuitao@kylinos.cn, asml.silence@gmail.com, dw@davidwei.uk
Date: Fri, 11 Sep 2026 18:16:52 +0000
Message-ID: <178915061220.219967.16553162669849588226@kernel.org>
In-Reply-To: <20260910180908.1506533-6-bjorn@kernel.org>
References: <20260910180908.1506533-6-bjorn@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 3 · Low: 0 (1)

- [Medium] In `process_recvzc()`
  (tools/testing/selftests/drivers/net/hw/iou-zcrx.c:304-312) the new…
- [Medium] The new hard failure in `run_server()` (iou-zcrx.c:389-391,
  `error(1, 0, "no payload CQE ending past offset %u",…
- [Medium] The test now enforces a placement guarantee that the in-tree
  zcrx UAPI documentation explicitly disclaims.

Pre-existing issues:
- [Low] The reflowed `usage()` string (iou-zcrx.c:422-429) disagrees with
  the option parser in the same file and with the Python driver: it…

--

selftests: drv-net: Test large zcrx buffers

The zcrx selftest now requests an RX buffer larger than twice the device
MTU and requires at least one zero-copy receive CQE to end past the first
MTU-sized region of its chunk. A new -E option carries the threshold, and
the server aborts if no such CQE was observed.

> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> index f6a8fc5fac241..c0d9065b21030 100644
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.c
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.c

[ ... ]

> @@ -298,6 +301,15 @@ static void process_recvzc(struct io_uring *ring, struct io_uring_cqe *cqe)
>  	mask = (1ULL << IORING_ZCRX_AREA_SHIFT) - 1;
>  	data = (char *)area_ptr + (rcqe->off & mask);
>  
> +	if (cfg_check_data_end) {
> +		unsigned int rx_buf_len = cfg_rx_buf_len ?: page_size;
> +		unsigned int data_end_off;
> +
> +		data_end_off = (rcqe->off & mask) % rx_buf_len + n;
> +		if (data_end_off > cfg_min_data_end)
> +			seen_data_end = true;
> +	}
> +

[Severity: Medium]
Can this predicate be satisfied by a driver that only uses the first
MTU-sized region?  It keys on the end of the fragment, and rcqe->off is the
payload start offset inside the chunk:

io_uring/zcrx.c:io_zcrx_queue_cqe() {
	...
	offset = off + (net_iov_idx(niov) << ifq->niov_shift);
	rcqe->off = offset + zcrx_area_id_to_token(area->area_id);
	...
}

with off derived from skb_frag_off(frag) in io_zcrx_recv_frag() and
niov_shift == ilog2(rx_buf_len).  So anything the driver places ahead of the
payload within the chunk (page pool headroom pp->p.offset, or per-packet
alignment padding such as the 128-byte payload alignment in fbnic) counts
toward cfg_min_data_end.

Over IPv6+TCP the maximum payload per segment is mtu - 60 (mtu - 72 with TCP
timestamps), so the margin here is only around 60 bytes.  A driver that
stores exactly one full-size segment in a large chunk, but starts the
payload 60 or more bytes into the chunk, would set seen_data_end and pass —
which is the case the commit message says should fail:

    "A driver which accepts the size but only uses the first MTU-sized
    region fails."

I could not point at an in-tree driver that reserves that much payload-buffer
headroom today, so this is about the strength of the check rather than an
observed pass.  Would keying on the payload start offset be placement
independent?

	(rcqe->off & mask) % rx_buf_len >= cfg_min_data_end

Alternatively, should the threshold account for the maximum per-buffer
headroom and alignment padding?

>  	for (i = 0; i < n; i++) {
>  		if (*(data + i) != payload[(received + i)])
>  			error(1, 0, "payload mismatch at %d", i);
> @@ -373,7 +385,10 @@ static void run_server(void)
>  		server_loop(&ring);
>  
>  	if (!stop)
> -		error(1, 0, "test failed\n");
> +		error(1, 0, "test failed after receiving %zu bytes", received);
> +	if (cfg_check_data_end && !seen_data_end)
> +		error(1, 0, "no payload CQE ending past offset %u",
> +		      cfg_min_data_end);
>  }

[Severity: Medium]
Does this turn a runtime configuration property into a driver failure?

On bnxt, one of the drivers advertising QCFG_RX_PAGE_SIZE, the hardware ends
each aggregation buffer at end-of-packet when TPA is off:

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_init_one_rx_agg_ring_rxbd() {
	...
	if (!(bp->flags & BNXT_FLAG_TPA))
		type |= RX_BD_FLAGS_AGG_EOP;
	...
}

and BNXT_FLAG_TPA comes only from user-settable features:

drivers/net/ethernet/broadcom/bnxt/bnxt.c:bnxt_set_tpa_flags() {
	bp->flags &= ~BNXT_FLAG_TPA;
	...
	if (bp->dev->features & NETIF_F_LRO)
		bp->flags |= BNXT_FLAG_LRO;
	else if (bp->dev->features & NETIF_F_GRO_HW)
		bp->flags |= BNXT_FLAG_GRO;
}

So with ethtool -K <dev> rx-gro-hw off, every packet payload starts at offset
0 of a fresh buffer, the requested rx_buf_len is still fully honored by
bnxt_validate_qcfg() and the -d probe succeeds, but data_end_off never
exceeds the MSS and run_server() aborts.

Separately, the threshold comes from the local interface MTU while the
received segment size is set by the peer and path MSS, so a jumbo-MTU
receiver talking to a 1500-byte peer cannot produce an end offset past the
MTU without hardware coalescing.

Should the test require or check for HW-GRO/LRO being enabled (or check an
offload/queue statistic) before making this a hard failure?

> @@ -406,8 +421,11 @@ static void run_client(void)
>  
>  static void usage(const char *filepath)
>  {
> -	error(1, 0, "Usage: %s (-4|-6) (-s|-c) -h<server_ip> -p<port> "
> -		    "-l<payload_size> -i<ifname> -q<rxq_id>", filepath);
> +	error(1, 0,
> +	      "Usage: %s (-4|-6) (-s|-c) -h<server_ip> -p<port>\n"
> +	      "\t-l<payload_size> -i<ifname> -q<rxq_id>\n"
> +	      "\t[-x<rx_buf_pages>] [-E<min_data_end>] [-d]\n",
> +	      filepath);
>  }

[Severity: Low]
This is a pre-existing mismatch and not introduced by this patch, but since
the string is being reflowed anyway: the usage text still advertises (-4|-6),
which the parser does not accept, and it omits -o<oneshot_recvs> and
-z<send_size>, which it does accept and which iou-zcrx.py uses in
test_zcrx_oneshot (-o 4 and -z 16384).

>  static void parse_opts(int argc, char **argv)
> @@ -425,7 +443,7 @@ static void parse_opts(int argc, char **argv)
>  		usage(argv[0]);
>  	cfg_payload_len = max_payload_len;
>  
> -	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:d")) != -1) {
> +	while ((c = getopt(argc, argv, "sch:p:l:i:q:o:z:x:E:d")) != -1) {
>  		switch (c) {
>  		case 's':
>  			if (cfg_client)

[ ... ]

> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> index b7a225fe4beae..a9f62c6b950bb 100755
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> @@ -175,9 +175,13 @@ def test_zcrx_large_chunks(cfg) -> None:
>  
>      single(cfg)
>      page_size = resource.getpagesize()
> +    mtu = cfg.dev["mtu"]
>      nr_pages = 2
> +    while nr_pages * page_size <= 2 * mtu:
> +        nr_pages *= 2
>      rx_buf_len = nr_pages * page_size
> -    rx_cmd = f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} -q {cfg.target} -x {nr_pages}"
> +    rx_cmd = (f"{cfg.bin_local} -s -p {cfg.port} -i {cfg.ifname} "
> +              f"-q {cfg.target} -x {nr_pages} -E {mtu}")
>      tx_cmd = f"{cfg.bin_remote} -c -h {cfg.addr_v['6']} -p {cfg.port} -l 12840"

[Severity: Medium]
Does this contradict the in-tree zcrx documentation, which is not updated by
this change?

Documentation/networking/iou-zcrx.rst, "Area chunking":

    Larger chunks don't give any additional guarantees about buffer sizes
    returned in CQEs, and they can vary depending on many factors like
    traffic pattern, hardware offload, etc.

The commit message states the opposite:

    "A driver which accepts the size but only uses the first MTU-sized
    region fails."

Mechanically seen_data_end is only set when some CQE satisfies
(rcqe->off % rx_buf_len) + res > mtu, so the driver has to pack more than one
fragment per chunk, or return a fragment larger than the L3 MTU via HW-GRO or
LRO.  A driver that allocates one large niov per frame and places one
MSS-sized segment at chunk offset 0 matches the documented contract and still
fails here.

Should the documented contract be tightened in the same change, or should the
assertion be diagnostic, or gated on a hardware coalescing capability?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260910180908.1506533-1-bjorn%40kernel.org
