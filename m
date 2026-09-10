Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72D34A79D;
	Thu, 10 Sep 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027145; cv=none; b=thzZaoUv0lnIfIKYm+zVEJXULzhpJ/VghxZhKwzxGSb5pvWyVLyhbc8wE2s31qeK7decWy2/x4GUX2vmuixUTTvY3tdp9ET24O76qUwL0P+r/tBgH0dHOmI8gJMMIBXvqguDiOmGf0q2qTnaE49zaYWmXrt2bytw3mMmWmjz5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027145; c=relaxed/simple;
	bh=2lWcsjCGdX3/u2h9rJeZ2x1Jf+m7SNDdJAOrTnoL3xA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ro7v9s+Vs4GKa9NHZXduE1ZvxiM5GFyEk1FcmB1E7ExgNUTuAsopTon5Ej/gMiT6o+1K19sd5ogQswS445b2p0f0EMV3cIeqv1sFphYLYkbxX5O2Qc1dLhXnnVN04zniN8FTACliq+5rrPgkbu5BMoOw2XRTfb4hpEwOhbAKj/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBfcBttm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBfcBttm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71C61F00893;
	Thu, 10 Sep 2026 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789027143;
	bh=mYmr/W/BYFQDMbpmKdQ8Fdffbdjog/xig14Mnia7uCo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SBfcBttm6C3tTIq7XA/eFFdsE7Dl9/pGxPJkyZm6jCJeHEhKVEKDCX6svfXji80Vu
	 Sw8iyxe5n/7s6coJC8bTlQH+PErzDf2w4QHZKyO7HVCvuIcp52c2QxauX2eLujnOmc
	 H2rf8qVHDwv3DHqquoDZCtwPF2Exc2JZMU4QwIHLS4wKA8VsYtqNzaVfnb9bB3sWYK
	 izmKMVpIoDAyTEArQRsfK2l+iqUmZXJOiZ/rQuFRhX50Zy17+yfZhcbyVrBmb6rxNL
	 aQXiB6PxAIjxtv8Hr4ScWLeBwfWofJwOZySv+tmIXH0WftzPbFaIYx4wh+MCcOwoGz
	 cldMjylGTHpBw==
Subject: Re: [PATCH net v2 2/2] selftests: net: packetdrill: test exclusion of
 old ACK from TCP fast path
From: netdev-bot+sashiko@kernel.org
To: inbal.lipshtat@mail.huji.ac.il
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 07:59:02 +0000
Message-ID: <178902714239.219967.13667145740374233304@kernel.org>
In-Reply-To: <20260909075644.1408171-3-inbal.lipshtat@mail.huji.ac.il>
References: <20260909075644.1408171-3-inbal.lipshtat@mail.huji.ac.il>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

- [Medium] tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-
  old-ack.pkt does not run the suite's `\`./defaults.sh\`` setup block.
- [Medium] The companion kernel patch in this series, commit "tcp:
  exclude old ACKs from tcp fast path" (net/ipv4/tcp_input.c, changing…
- [Low] The new file
  tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt…

--

selftests: net: packetdrill: test exclusion of old ACK from TCP fast path

This adds a new packetdrill script that feeds an in-sequence data segment
carrying an excessively old ACK and expects the connection to fall out of
the header prediction fast path into the slow path, where the RFC 5961 5.2
check drops the payload and emits a challenge ACK.  No Link: tags are
present in the commit header.

A few questions below, one about the companion kernel patch metadata and
two about the new script itself.

> selftests: net: packetdrill: test exclusion of old ACK from TCP fast path

[Severity: Medium]
A question about the companion patch in this series rather than this test:
"tcp: exclude old ACKs from tcp fast path" changes the header prediction
predicate in tcp_rcv_established() from

	!after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)

to

	between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)

but carries neither a Fixes: tag nor Cc: stable@vger.kernel.org, even
though it has Reported-by: credits from external researchers.

Before that change, an in-sequence data segment with an arbitrarily old
ACK field satisfied the fast path predicate, and in the fast path the
payload was queued and RCV.NXT advanced before the ACK was validated:

net/ipv4/tcp_input.c:tcp_rcv_established() {
	...
	eaten = tcp_queue_rcv(sk, skb, &fragstolen);

	tcp_event_data_recv(sk, skb);

	if (TCP_SKB_CB(skb)->ack_seq != tp->snd_una) {
		/* Well, only one small jumplet in fast path... */
		tcp_ack(sk, skb, flag | FLAG_DATA);
	...
}

The negative return from tcp_ack() (-SKB_DROP_REASON_TCP_TOO_OLD_ACK,
produced by the RFC 5961 5.2 branch) was ignored there, so the data was
already accepted.  Since the input is remote packet data, should the
companion patch pick up a stable tag?  git blame points at 31770e34e43d6
("tcp: Revert \"tcp: remove header prediction\"") as the Fixes: candidate
for the predicate.

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
> new file mode 100644
> index 000000000000..8e7229127670
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
> @@ -0,0 +1,23 @@
> +// Test rejection of data segments carrying excessively old ACKs
> +
> +0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3

[Severity: Medium]
Should this script source the suite's setup block before the socket call?
Every other .pkt file in tools/testing/selftests/net/packetdrill/ starts
with it, for example tcp_rfc5961_ack-out-of-window.pkt:

	`./defaults.sh
	sysctl -q net.ipv4.tcp_invalid_ratelimit=0
	`

ksft_runner.sh does no sysctl or qdisc setup of its own:

	unshare -n packetdrill ${ip_args[$ip_version]} ${optargs[@]} $script > /dev/null \

so without the block the test runs with host-inherited values for
net.core.default_qdisc, net.ipv4.tcp_rmem/tcp_wmem, tcp_ecn,
tcp_timestamps, tcp_congestion_control and tcp_slow_start_after_idle, and
tun0 never gets the explicit pfifo that defaults.sh installs:

	# Override the default qdisc on the tun device.
	# Many tests fail with timing errors if the default
	# is FQ and that paces their flows.
	tc qdisc add dev tun0 root pfifo

Both expected outbound packets here are asserted at +0, and the receive
memory sysctls feed into the sk_rcvbuf / sk_forward_alloc state that the
500-byte priming segment is there to establish.  Can the result of this
test vary with the host configuration as written?

Also, is tcp_invalid_ratelimit relevant here?  The sibling RFC 5961 test
pins it to 0 before expecting a challenge ACK.

[Severity: Low]
This isn't a bug, but the new file has no SPDX-License-Identifier line.
Both sibling RFC 5961 scripts start with

	// SPDX-License-Identifier: GPL-2.0

(tcp_rfc5961_ack-out-of-window.pkt and tcp_rfc5961_rst-syn-recv.pkt), as
do 105 of the .pkt scripts in that directory, though the tcp_accecn_*.pkt
group does not.  Documentation/process/license-rules.rst asks for the tag
in new files.

> +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
> ++0 bind(3, ..., ...) = 0
> ++0 listen(3, 1024) = 0

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909075644.1408171-1-inbal.lipshtat%40mail.huji.ac.il
