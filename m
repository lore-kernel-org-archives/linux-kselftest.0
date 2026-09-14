Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D0358369;
	Mon, 14 Sep 2026 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789363600; cv=none; b=sMHGJ71HBlImGL94qXbX1i1cH/aPmLQ8JkZJY1Of09bjv0FY3lIu7mUi9Kp0p0kG00ruN1busIrx4YrQyR06esGiZ9yg8uO6U8jOK2XALYIBfpPCZ3s8+2qDI+o+pGkq6Ik/RtaVoBDc5csWp7xbGJZfj+wZGiBRxfpsek7HOEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789363600; c=relaxed/simple;
	bh=ap5GeeQ6pIcbH7SaZSFKXsaOUZB5OzY5Y7N0dw3EnIc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eFLW3qQ3FL249tGC5J6vyPmDcgqjWU2t0EmXqViZL2zWT+IiFKxqDp8C3Jbt+B6krQ1D6/wdRj7O3Plp34kLzFXkz5AbcRwaFsigrpapw5ruwGUqWiuS30pDwAn+4AVlZuffCRAZ5N+4T/xFUU9LDMS97sZ2d5kUPRc1KQjHeic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9+gaqeK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9+gaqeK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2CC1F000FF;
	Mon, 14 Sep 2026 05:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789363598;
	bh=phukx6WsNWBEsgKo8B6xdi7L3MqgYMUEnITAIfa3Wb4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j9+gaqeKY2cojwureojrXiBVqunb/Zt2ht88pimKhVhI840B4N0fe896Pb7injtEl
	 X+7iSgQLMEoV89gatvAWnJS+bxRkX2WUUywRieI5sjjdfg99PNwR2m1J+nNvumCCnR
	 HT+wov7+axAAJn90hZbzzw7nKHANY3ps5uq03QU03DByhxHFhE+U/HeqE3XmCQdjkD
	 yrogp+iBMaWeoAvKW3XlzZ08peYnjnpcEm9wi0NCrWReltNKVKgWNV77y1krx8UW0F
	 u6zs8rAPZe5Xc5IhrK8XxlKIw1xSM9Ik+ghoEP5XfySsyNJmiDxIdfkHdMhRMI7NNe
	 KuBKE2z+AEIaA==
Subject: Re: [PATCH net-next v3] selftests: drv-net: add BIG TCP test cases
From: netdev-bot+sashiko@kernel.org
To: narcisav.kernel@gmail.com
Cc: netdev@vger.kernel.org, kuba@kernel.org, daniel.zahka@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, shuah@kernel.org, horms@kernel.org, willemb@google.com,
 petrm@nvidia.com, anubhavsinggh@google.com, richardbgobert@gmail.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 05:26:37 +0000
Message-ID: <178936359771.22033.17578992147371005884@kernel.org>
In-Reply-To: <20260913052419.77910-1-narcisav.kernel@gmail.com>
References: <20260913052419.77910-1-narcisav.kernel@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 1

- [Medium] The four new `big_tcp_*` variants are yielded by
  `_gro_variants()` in tools/testing/selftests/drivers/net/gro_lib.py…
- [Low] The patch changes the failure-tolerance policy in `run_test()`
  from `test_name.startswith("large_")` to…

Pre-existing issues:
- [Medium] `check_recv_pkts()` (tools/testing/selftests/net/lib/gro.c)
  reads `correct_payload[num_pkt]` once per received non-FIN frame with…

--

selftests: drv-net: add BIG TCP test cases

This adds four new GRO selftest cases (big_tcp_data_same,
big_tcp_data_lrg_sml, big_tcp_tcp_seq, big_tcp_large_max) that exercise
coalescing past the legacy IP_MAXPACKET limit by raising the device
gro_max_size/gro_ipv4_max_size to 128000.  It also doubles
gro_flush_timeout for those cases and extends the KSFT_MACHINE_SLOW
failure tolerance to them.

A few questions below.

> diff --git a/tools/testing/selftests/drivers/net/gro_lib.py b/tools/testing/selftests/drivers/net/gro_lib.py
> index b7ac0660adc01..abecf60baa537 100644
> --- a/tools/testing/selftests/drivers/net/gro_lib.py
> +++ b/tools/testing/selftests/drivers/net/gro_lib.py

[ ... ]

> @@ -91,6 +97,34 @@ def _set_mtu_restore(dev, mtu, host):
>          defer(ip, f"link set dev {dev['ifname']} mtu {dev['mtu']}", host=host)
>  
>  
> +def _set_gro_size_restore(cfg, size):
> +    """
> +    Set the local device's GRO size limits, then confirm they stuck.
> +    """
> +
> +    _set_mtu_restore(cfg.dev, 4096, None)
> +    _set_mtu_restore(cfg.remote_dev, 4096, cfg.remote)
> +
> +    if "gro_max_size" not in cfg.dev or "gro_ipv4_max_size" not in cfg.dev:
> +        raise KsftSkipEx("iproute2 does not report the GRO size limits")
> +
> +    if (cfg.dev["gro_max_size"] == size and
> +            cfg.dev["gro_ipv4_max_size"] == size):
> +        return
> +
> +    old = (f"gro_max_size {cfg.dev['gro_max_size']} "
> +           f"gro_ipv4_max_size {cfg.dev['gro_ipv4_max_size']}")
> +    new = f"gro_max_size {size} gro_ipv4_max_size {size}"
> +
> +    ip(f"link set dev {cfg.ifname} {new}")
> +    defer(ip, f"link set dev {cfg.ifname} {old}")

[ ... ]

> @@ -239,7 +273,11 @@ def _setup(cfg, mode, test_name):
>          flush_path = f"/sys/class/net/{cfg.ifname}/gro_flush_timeout"
>          irq_path = f"/sys/class/net/{cfg.ifname}/napi_defer_hard_irqs"
>  
> -        ctl_file_write(flush_path, "200000")
> +        # "big_tcp_*" tests need a longer timeout, use 2x the regular timeout
> +        if test_name.startswith("big_tcp_"):
> +            ctl_file_write(flush_path, "400000")
> +        else:
> +            ctl_file_write(flush_path, "200000")
>          ctl_file_write(irq_path, "10")

[ ... ]

> @@ -322,6 +368,10 @@ def _gro_variants():
>          for test_name in common_tests:
>              yield protocol, test_name
>  
> +        if protocol in ["ipv4", "ipv6"]:
> +            for test_name in big_tcp_tests:
> +                yield protocol, test_name
> +

[Severity: Medium]
Should the new variants be restricted to the software GRO mode here?

_gro_variants() has no notion of the coalescing mode, so the four
big_tcp_* cases are also instantiated by gro_hw.py (gro_main(__file__,
"hw")) and gro_lro.py (gro_main(__file__, "lro")).

The expectations for those cases come only from the netdev software GRO
tunable.  _set_gro_size_restore() writes gro_max_size /
gro_ipv4_max_size, and the only consumer of that value in the stack is
skb_gro_receive() in net/core/gro.c:

	if (unlikely(p->len + len >= netif_get_gro_max_size(p->dev, p) ||
		     NAPI_GRO_CB(skb)->flush))
		return -E2BIG;

git grep gro_max_size drivers/net/ returns nothing, and
netif_set_gro_max_size() / netif_set_gro_ipv4_max_size() in net/core/dev.h
only WRITE_ONCE the netdev fields without notifying the driver.

So with rx-gro-hw or LRO enabled the hardware coalescer keeps to its own
(commonly 64 KB) limit and cannot produce the >65535 byte aggregate that
big_tcp_data_same and friends expect, and big_tcp_large_max cannot stop
at big_tcp_large_cnt() * calc_mss().  In that case check_recv_pkts()
fails with "incorrect number of packets" or "incorrect packet geometry".

Note also that the compensating gro_flush_timeout bump added above only
happens inside the "if mode == \"sw\":" branch of _setup(), which suggests
these cases were designed for software GRO only.

>          if protocol in ["ipv4", "ipip"]:
>              for test_name in ipv4_tests:
>                  yield protocol, test_name
> @@ -358,7 +408,8 @@ def run_test(cfg, mode, protocol, test_name):
>          if rx_proc.ret == 42:
>              raise KsftFailEx(f"GRO over-coalesced in {protocol}/{test_name}")
>  
> -        if test_name.startswith("large_") and os.environ.get("KSFT_MACHINE_SLOW"):
> +        if (test_name.startswith(("large_", "big_tcp_")) and
> +                os.environ.get("KSFT_MACHINE_SLOW")):
>              ksft_pr(f"Ignoring {protocol}/{test_name} failure due to slow environment")
>              return

[Severity: Low]
Could the commit message mention this policy change too?

The changelog only says:

  "Use a gro_flush_timeout value 2x higher for the BIG TCP test cases
   to prevent under-coalescing."

but run_test() now also returns success for any non-over-coalescing
failure of the four new cases whenever KSFT_MACHINE_SLOW is set.  That is
described only in the v3 notes below the "---" marker, which are dropped
when the patch is applied, so git history would not record that the new
cases are advisory on slow machines.

> diff --git a/tools/testing/selftests/net/lib/gro.c b/tools/testing/selftests/net/lib/gro.c
> index 7a333155de1ab..70b0deb3c11fa 100644
> --- a/tools/testing/selftests/net/lib/gro.c
> +++ b/tools/testing/selftests/net/lib/gro.c

[ ... ]

> @@ -166,6 +182,27 @@ static int num_large_pkt(void)
>  	return max_payload() / calc_mss();
>  }
>  
> +/* How many maximum sized segments fit under the configured limit. */
> +static int big_tcp_large_cnt(void)
> +{
> +	return (BIG_TCP_GRO_MAX_SIZE - 1 - (total_hdr_len - ETH_HLEN)) /
> +	       calc_mss();
> +}
> +
> +/* How many calc_mss() sized segments are needed to satisfy the
> + * following condition:
> + * pkt_count * calc_mss() < IP_MAXPACKET < (pkt_count + 1) * calc_mss()
> + */
> +static int big_tcp_fill_cnt(void)
> +{
> +	return IP_MAXPACKET / calc_mss();
> +}

[ ... ]

> @@ -1161,7 +1253,7 @@ static void recv_error(int fd, int rcv_errno)
>  static void check_recv_pkts(int fd, int *correct_payload,
>  			    int correct_num_pkts)
>  {
> -	static char buffer[IP_MAXPACKET + L2_HLEN_MAX + 1];
> +	static char buffer[BIG_TCP_RECV_BUF_LEN];

[Severity: Medium]
This isn't a bug introduced by this patch, but do the new cases make it
easy to read past the end of correct_payload[]?

check_recv_pkts() indexes the expectation array once per received
non-FIN frame with no bound on num_pkt:

tools/testing/selftests/net/lib/gro.c:check_recv_pkts() {
	while (1) {
		...
		vlog("%d ", data_len);
		if (data_len != correct_payload[num_pkt]) {
			vlog("[!=%d]", correct_payload[num_pkt]);
			bad_packet = true;
		}
		bytes_received += data_len;
		num_pkt++;
	}
}

while gro_receiver() supplies:

	static int correct_payload[NUM_PACKETS];

with NUM_PACKETS defined as 4.

For IPv4 at the MTU 4096 that _set_gro_size_restore() configures,
calc_mss() is 4056 and big_tcp_fill_cnt() is 16, so big_tcp_data_same,
big_tcp_data_lrg_sml and big_tcp_tcp_seq put 17 data segments on the wire
while passing correct_num_pkts of 1 or 2, and big_tcp_large_max sends
big_tcp_large_cnt() + 1 = 32 segments while passing 2.

Whenever GRO under-coalesces - which the 6 retries, the doubled
gro_flush_timeout and the KSFT_MACHINE_SLOW tolerance in gro_lib.py all
anticipate, and which is unavoidable in the hw/lro modes where
gro_max_size has no effect - the loop runs 17 or 32 times and reads
correct_payload[4] through correct_payload[31].

Would it make sense to bound the loop with something like

	if (num_pkt >= correct_num_pkts)
		break;

or to size correct_payload[] for the worst case (BIG_TCP_MAX_FILL_CNT + 1)?

>  	int nhoff = ETH_HLEN + (pppoe ? PPPOE_SES_HLEN : 0);
>  	struct iphdr *iph = (struct iphdr *)(buffer + nhoff);
>  	struct ipv6hdr *ip6h = (struct ipv6hdr *)(buffer + nhoff);

[ ... ]

> @@ -1541,6 +1633,25 @@ static void gro_sender(void)
>  		send_large(txfd, &daddr, remainder + 1);
>  		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
>  
> +	/* big tcp sub-tests */
> +	} else if (strcmp(testname, "big_tcp_data_same") == 0) {
> +		send_big_tcp(txfd, &daddr, calc_mss(), big_tcp_fill_cnt(),
> +			     calc_mss());
> +		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);

[ ... ]

> +	} else if (strcmp(testname, "big_tcp_large_max") == 0) {
> +		send_big_tcp(txfd, &daddr, calc_mss(), big_tcp_large_cnt(),
> +			     calc_mss());
> +		write_packet(txfd, fin_pkt, total_hdr_len, &daddr);
> +

[ ... ]

> @@ -1768,6 +1879,26 @@ static void gro_receiver(void)
>  		printf("last segment sent individually: ");
>  		check_recv_pkts(rxfd, correct_payload, 3);
>  
> +	/* big tcp sub-tests */
> +	} else if (strcmp(testname, "big_tcp_data_same") == 0) {
> +		correct_payload[0] = big_tcp_fill_len() + calc_mss();
> +		printf("data packets of same size past IP_MAXPACKET: ");
> +		check_recv_pkts(rxfd, correct_payload, 1);
> +	} else if (strcmp(testname, "big_tcp_data_lrg_sml") == 0) {
> +		correct_payload[0] = big_tcp_fill_len() + calc_mss() / 2;
> +		printf("smaller last packet past IP_MAXPACKET: ");
> +		check_recv_pkts(rxfd, correct_payload, 1);
> +	} else if (strcmp(testname, "big_tcp_tcp_seq") == 0) {
> +		correct_payload[0] = (big_tcp_fill_cnt() + 1) * calc_mss();
> +		correct_payload[1] = calc_mss();
> +		printf("aliased seq past IP_MAXPACKET doesn't coalesce: ");
> +		check_recv_pkts(rxfd, correct_payload, 2);
> +	} else if (strcmp(testname, "big_tcp_large_max") == 0) {
> +		correct_payload[0] = big_tcp_large_cnt() * calc_mss();
> +		correct_payload[1] = calc_mss();
> +		printf("shouldn't coalesce past gro_max_size: ");
> +		check_recv_pkts(rxfd, correct_payload, 2);
> +

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260913052419.77910-1-narcisav.kernel%40gmail.com
