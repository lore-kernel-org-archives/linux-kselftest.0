Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837039;
	b=utm2YPXSrvqtVCnHG0nhxh54esZ7wHThRKOQxj0KhV2igif19BxcQ00pW7wXPi00M+B2
	 mlC88WqvOTgJclGzsiMKIugpJYDmrOUZ4xMfCKXrY44H1tQphuHYUTtS71x/M1uI8kYb2
	 JCICbv1/LiP5IHDfAqJEeucTXdKA2sBYovftmzopVINPfiQU3z+1yJv9YJ9WI/froPOio
	 mhVolB9dMOdw+ta9P8mROQ2pg1BZkBkFu24pGJZ79R46a/axH/TiNb0MK+F22g5Cfb0Rx
	 SSfrIEdwwu6R2+Xxc/sg7vA7+JEmkAk/9jFxNmfkL7SZ8CHFsSopGCcsZY3afHCkWHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837039;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=/3e3TImcCJs1Ha+JQOqG/r2t+apyd9H8tJkNWnphjK4=;
	b=V76eKd4cZYTXrRIf4G11rvnG4KHZ50J7k8kNBcZc3DKCP0+Z8lTExQlvBOe2Nyhsn4M2
	 pJzGSZXqu1Pfo1xIpm0A/nZUq5kpgm5T4mo4OLTmc4p3G05eqdWcG0xKFRTBhr8yIUTtZ
	 As9JAKEAOcntMLzzou/p5QWDYO62iBq0KmZhqfRZOkErz276Yw9OjVoVX12Xal3BtPhnd
	 ioHL/QWeCT+VXcCpEcTjm5FJbtlaPz7g3RLQbXh+6Rfqh4unWIyJkocWGrmh2Fkl8KnJE
	 qRMGgvXU2S5SpDSLgGM7Yga7PMOiNl8HgUpwFtHtgeyd+HYZ1yL5Ei97LXQsn0B0a4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FnbMR3k/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85B606A8BF;
	Mon, 16 Nov 2026 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnbMR3k/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4631F000CA;
	Mon, 16 Nov 2026 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837039;
	bh=/3e3TImcCJs1Ha+JQOqG/r2t+apyd9H8tJkNWnphjK4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FnbMR3k/s1857WfSWh6tB9WVVi7dyXHR6AtKTHY8lgxg48vmtBjWsrOcT5gNOxYNh
	 efyOBtSbehimVZruZ2K5iLWS9cBvHXWZOEVTPLkYu/BMgpSa9kaeh8/eEVbO67rROk
	 OKmNONRqKaLYfByF8V0TAOsBY+NoS4JSrx4wcRBMRuBjzmb8mwVEFPZ/R+L36mVvUI
	 lfOZjeL3v10Wd00CNtaNnR4w/XX5qbuBanlg0VwDjkYwymDn7ezV2R07mTClvdT/o6
	 OOnYXOjg1IukP94opXGL85q6++NCt1EP6lHe5qk1/iKaHTgFQZOzh7A29ZSt+8nzjz
	 /jpOhYmHUwrBA==
Subject:
 Re: [PATCH net 2/2] selftests: net: check UDP tunnel GRO virtio offsets
From: netdev-bot+sashiko@kernel.org
To: bryon@fryer.io
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 horms@kernel.org, jasowangio@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 pabeni@redhat.com, shuah@kernel.org
Date: Mon, 16 Nov 2026 13:50:37 +0000
Message-ID: <179483703798.3136.17536195102947528618@kernel.org>
In-Reply-To: <20261112030708.1915665-3-bryon@fryer.io>
References: <20261112030708.1915665-3-bryon@fryer.io>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In the gro_on variant, TEST_F(tun_vnet_gro,
  outer_transport_header) in tools/testing/selftests/net/tun.c reports…
- [Low] In TEST_F(tun_vnet_gro, outer_transport_header)
  (tools/testing/selftests/net/tun.c), `len` is an `int` that holds the…

--

selftests: net: check UDP tunnel GRO virtio offsets

This adds a tun_vnet_gro fixture to the tun selftest. It writes Geneve/TCP
frames into a NAPI TAP, bridges them to a second virtio-header TAP, and
compares the exported tunnel offsets and checksum fields of the GRO
aggregate with the parsed wire headers. A gro_off variant is used as a
packet integrity control.

> diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
> index 34de2580e32ec..192b3e0c0d172 100644
> --- a/tools/testing/selftests/net/tun.c
> +++ b/tools/testing/selftests/net/tun.c

[ ... ]

> +TEST_F(tun_vnet_gro, outer_transport_header)
> +{
> +	uint8_t input[GRO_BUFFER_SIZE], output[GRO_BUFFER_SIZE];
> +	unsigned int seen = 0, aggregates = 0, records = 0;
> +	/* Bound the wait even if forwarding fails or packets are lost. */
> +	int64_t deadline = gro_milliseconds() + GRO_RECEIVE_TIMEOUT_MS;
> +	struct pollfd pfd = { .fd = self->fd[1], .events = POLLIN };
> +	int i, len, frame_len, ready;

[ ... ]

> +		ASSERT_NE(pfd.revents & POLLIN, 0);
> +		ASSERT_LT(records++, 128);
> +		len = read(self->fd[1], output, sizeof(output));
> +		ASSERT_GE(len, TUN_VNET_TNL_SIZE + ETH_HLEN);
> +		frame_len = len - TUN_VNET_TNL_SIZE;

[Severity: Low]
Can a failed read() get past this assert? len is an int, but
TUN_VNET_TNL_SIZE is sizeof(struct virtio_net_hdr_v1_hash_tunnel), so the
right-hand side is a size_t. __EXPECT() keeps the type of each operand:

	__typeof__(_expected) __exp = (_expected);
	__typeof__(_seen) __seen = (_seen);
	if (!(__exp _t __seen)) {

That means a -1 from read() is compared as SIZE_MAX, and the assert passes.

read() can fail even after poll() reports POLLIN. tun_do_read() dequeues
the skb and calls tun_put_user(), which can return -EINVAL from
virtio_net_hdr_tnl_from_skb(). The skb is freed either way:

drivers/net/tun.c:tun_do_read() {
    ...
	ret = tun_put_user(tun, tfile, skb, to);
	if (unlikely(ret < 0))
		kfree_skb(skb);
    ...
}

When that happens, frame_len goes negative. The later ASSERT_GE(frame_len,
...) checks against size_t or unsigned operands pass for the same reason.

On the first iteration, output[] is uninitialized stack memory. The MAC
memcmp() then most likely mismatches and the error is dropped by the
continue. On later iterations the stale previous frame is parsed until the
tot_len check fails with a misleading message.

The test still fails in the end because seen never reaches 0xff, but the
real errno is never reported. Would an ASSERT_GE(len, 0) before this check,
or an (int) cast on the size, give a clearer failure?

[ ... ]

> +		if (!variant->gro || vh->gso_type == VIRTIO_NET_HDR_GSO_NONE) {
> +			ASSERT_EQ(vh->gso_type, VIRTIO_NET_HDR_GSO_NONE);
> +			ASSERT_EQ(segments, 1);
> +			ASSERT_EQ(le16toh(vh->gso_size), 0);
> +			ASSERT_EQ(gro_build_packet(input, first), len);
> +			ASSERT_EQ(memcmp(frame, input + TUN_VNET_TNL_SIZE, frame_len), 0);
> +			continue;
> +		}

[ ... ]

> +	ASSERT_EQ(seen, (1U << GRO_PACKETS) - 1);
> +	if (variant->gro && !aggregates && _metadata->exit_code != KSFT_FAIL)
> +		SKIP(return, "No multi-segment GRO aggregate observed");

[Severity: Medium]
Does this match the commit message? The commit message says:

  Require a multi-segment GRO aggregate ... No output or no merge is not
  a pass.

In kselftest_harness.h, SKIP() is documented as forcing a "pass" after
reporting why the test is skipped. It sets _metadata->exit_code to
KSFT_SKIP, which appears as "ok ... # SKIP" in the TAP output.

In the gro_on variant, the GSO_NONE branch above accepts unmerged frames
after only an integrity check. Those frames never reach the
outer_th_offset and inner_nh_offset checks. virtio_net_hdr_tnl_from_skb()
only fills those fields for SKB_GSO_UDP_TUNNEL or SKB_GSO_UDP_TUNNEL_CSUM
skbs, which means only for aggregates.

Suppose Geneve GRO stops merging, or the tunnel GSO export path stops
producing tunnel GSO skbs. All 8 packets would then arrive as valid
singles, seen would become 0xff, aggregates would stay 0, and the test
would report SKIP.

Wouldn't a regression in the path this test targets then look like an
environment skip instead of a failure? Should the gro_on variant fail
here instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112030708.1915665-1-bryon%40fryer.io
