Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289715;
	b=qgYCVUCSyBETEdbM9ddtPkBB/BypOoKMDw9qMXxrwPFGpMwdFYEcVcsIBbDIE/vutNK9
	 7ydfSWJ/MDHgrYXhuuG15muvJcHb9ea0fkqjrRHhxaLPBQ5z2IEpE8ZdEtzY5Z2RNvuOu
	 dOgynMHWMLbEjbM9zuQvvyElq5yfJtftiv7MWsDSP61WEMpEULiQhH0Rb9dPLmH4pV0WM
	 J4qXtOC8D4pggK+qHli4Kmy7/YRPnw0u/Q2s3x3HW+d//T+vqAZiPEjNGJKQgy7DfaUgR
	 AGi1cYOK0tMUzQfDnKM++WqqNKYOcXMrSSriqeHyAn3DKIpmwvuKDIrqX7iUgN6PgEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289715;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JH+iXlWaf0QYvuXeZ5FGygsDHzmcBZZQOeinMNmsuMo=;
	b=ugnaMMzhIW6SppZk8o3QZqKpToGaRyVmR0Ri3oT7GXPoMGwKew3z7PMuORY/K0+68Xvk
	 LSISrQo9yshJCLjDOColgu1w7oIHwfCgczFyGVWJMw6RskWBMRnpsUNRFzOYMRuFGXsM3
	 uSyUFkDCGBBZPwTjgQ8g1tAGDStqgYOBMSXSoNn+5N9oFY2mqj9wGQzMEajSovABTaBus
	 3WStCRkVlqF/ZVi0wW39zGm6mBBewgcZk20l6d4iQo5kLH+veDoXa0Hhmr3JN8iydL+xM
	 6l0KEdMis/iDjLA+0uWHdGTmjiEwrAo1/PiFknVEbrOrtFGyhTPU1uGGvcdZ4t3N3Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f32ag3IC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDB606A320;
	Sat, 21 Nov 2026 19:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f32ag3IC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9B71F000C0;
	Sat, 21 Nov 2026 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289715;
	bh=JH+iXlWaf0QYvuXeZ5FGygsDHzmcBZZQOeinMNmsuMo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f32ag3IC/vl5IywST6f+vJ0yHzSYwOZFQP0PowGjHdAFvmry7mgIj3EqIOz1DJ7Ah
	 gcS/2i2r+AcuvZW/v8aMtUXyK9G4kqk3eSrh6z/sYdhRpneE6LIOIk2yHSNWzMpk7o
	 5e4z+mqGJRpazfiRXTz25oABoXbfbzS4n1fa2HbT1oGphZmtYKdwSM9dMwUYmcBZ6Y
	 awzrqOGBNJmI/0Wc4Sgq0yARum1GKhplCFWzj0cwwbcy3FidY/zqf+8intUbAe6Mx5
	 HY0b11DSRfrcEmJ/5XmmZjSYpHG3bIHt9+BU5nRoKqJR6vVqBgOnEbnnbt0ZF14mxn
	 JAqkogyS0WOEQ==
Subject: Re: [PATCH net-next v2 1/2] tcp: document black hole detection for
 tcp_mtu_probing
From: netdev-bot+sashiko@kernel.org
To: echoowall@gmail.com
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org,
 shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com,
 kuniyu@google.com, skhan@linuxfoundation.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sat, 21 Nov 2026 19:35:14 +0000
Message-ID: <179528971425.3135.11498750682572420334@kernel.org>
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
References: <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new tcp_mtu_probing text in Documentation/networking/ip-
  sysctl.rst (lines 725-731) says: "From then on, and from the first…
- [Low] The new detection-time text (ip-sysctl.rst lines 716-723) says
  the threshold is the time tcp_retries1 retransmissions would take…
- [Low] The new text (ip-sysctl.rst lines 728-729) says search_low is
  kept "at most tcp_base_mss and at least tcp_mtu_probe_floor and…
- [Low] The new text (ip-sysctl.rst lines 716-718) says "A black hole is
  detected when the retransmission timer fires after the handshake and…

--

tcp: document black hole detection for tcp_mtu_probing

This commit extends the tcp_mtu_probing entry in ip-sysctl.rst. It
describes when an ICMP black hole is detected and how TCP adjusts the MSS
afterwards, based on tcp_write_timeout() and tcp_mtu_probing(). It also
adds the default values of tcp_mtu_probing and tcp_base_mss.

> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> index 0b7bfbd98a923..6ac8b3fb9aae8 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst

[ ... ]

> @@ -711,6 +713,25 @@ tcp_mtu_probing - INTEGER
>  	- 1 - Disabled by default, enabled when an ICMP black hole detected
>  	- 2 - Always enabled, use initial MSS of tcp_base_mss.
>  
> +	A black hole is detected when the retransmission timer fires after
> +	the handshake and retransmissions have stayed unacknowledged for as

[Severity: Low]
Should this also cover the zero window case? In tcp_retransmit_timer(),
if the peer advertises a zero window and the socket is not orphaned, the
timer takes a separate branch and never gets to tcp_write_timeout():

net/ipv4/tcp_timer.c:tcp_retransmit_timer() {
    ...
	if (!tp->snd_wnd && !sock_flag(sk, SOCK_DEAD) &&
	    !((1 << sk->sk_state) & (TCPF_SYN_SENT | TCPF_SYN_RECV))) {
		...
		tcp_enter_loss(sk);
		tcp_retransmit_skb(sk, skb, 1);
		__sk_dst_reset(sk);
		goto out_reset_timer;
	}

	__NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPTIMEOUTS);
	if (tcp_write_timeout(sk))
		goto out;
    ...
}

While the window stays at zero, no black hole is detected and the MSS is
not lowered, however long the retransmissions stay unacknowledged.

> +	long as tcp_retries1 retransmissions would take with an RTO starting
> +	at 200 ms and doubling each time, which is 3 seconds with the

[Severity: Low]
Does the RTO keep doubling when tcp_rto_max is not the default?
tcp_model_timeout() stops doubling at tcp_rto_max(sk):

net/ipv4/tcp_timer.c:tcp_model_timeout() {
	...
	linear_backoff_thresh = ilog2(tcp_rto_max(sk) / rto_base);
	if (boundary <= linear_backoff_thresh)
		timeout = ((2 << boundary) - 1) * rto_base;
	else
		timeout = ((2 << linear_backoff_thresh) - 1) * rto_base +
			(boundary - linear_backoff_thresh) * tcp_rto_max(sk);
	...
}

icsk_rto_max comes from net.ipv4.tcp_rto_max_ms, which can be set as low
as 1000, or from the TCP_RTO_MAX_MS socket option.

Take tcp_rto_max_ms=1000 with the default tcp_retries1=3.
linear_backoff_thresh is then ilog2(5) = 2, so the threshold is
7 * 200 + 1 * 1000 = 2400 ms, not 3 seconds.

The flow's own RTO is also capped at 1 s, so timeouts fire at 0.2, 0.6,
1.4, 2.4 and 3.4 s. Detection then happens about 3.4 s after the original
transmission, not about 6 s.

With the default 120 s rto_max, a tcp_retries1 above 9 also makes the
threshold grow linearly in 120 s steps instead of doubling.

Could the text say that the doubling is capped at tcp_rto_max_ms, and
that the 3 and 6 second figures assume the default?

> +	default tcp_retries1. This time is counted from the first
> +	retransmission and only checked when the timer fires, so a flow
> +	with a 200 ms RTO detects the black hole at the fifth timeout,
> +	about 6 seconds after the original transmission.
> +
> +	With value 1, the first detection enables MTU probing and lowers
> +	the MSS to tcp_base_mss if it is larger. From then on, and from the
> +	first detection with value 2, each further retransmission timeout

[Severity: Medium]
Does every further retransmission timeout really lower search_low? In
tcp_write_timeout(), tcp_mtu_probing() is only called while the
tcp_retries1 condition holds:

net/ipv4/tcp_timer.c:tcp_write_timeout() {
	...
		if (retransmits_timed_out(sk, READ_ONCE(net->ipv4.sysctl_tcp_retries1), 0)) {
			/* Black hole detection */
			tcp_mtu_probing(icsk, sk);

			__dst_negative_advice(sk);
		}
	...
}

retransmits_timed_out() returns false whenever icsk_retransmits is zero:

net/ipv4/tcp_timer.c:retransmits_timed_out() {
	...
	if (!inet_csk(sk)->icsk_retransmits)
		return false;
	...
}

tcp_ack() resets that counter as soon as snd_una advances:

net/ipv4/tcp_input.c:tcp_ack() {
	...
	if (after(ack, prior_snd_una)) {
		flag |= FLAG_SND_UNA_ADVANCED;
		WRITE_ONCE(icsk->icsk_retransmits, 0);
	...
}

Once the connection recovers, for example after the first halving lets
packets through, a later isolated RTO does not halve search_low again.
Only timeouts during a new stall that lasts past the tcp_retries1
threshold do.

The commit message says the text describes the behaviour "as implemented
in tcp_write_timeout() and tcp_mtu_probing()". Could this sentence be
reworded, for example to "each further timeout at which the black hole
condition still holds"?

> +	lowers search_low to half its MSS, keeping it at most tcp_base_mss
> +	and at least tcp_mtu_probe_floor and tcp_min_snd_mss, and lowers the

[Severity: Low]
Can search_low end up above tcp_base_mss? tcp_mtu_probing() applies the
cap first and the floors after it, so the floors win:

net/ipv4/tcp_timer.c:tcp_mtu_probing() {
	...
		mss = tcp_mtu_to_mss(sk, icsk->icsk_mtup.search_low) >> 1;
		mss = min(READ_ONCE(net->ipv4.sysctl_tcp_base_mss), mss);
		mss = max(mss, READ_ONCE(net->ipv4.sysctl_tcp_mtu_probe_floor));
		mss = max(mss, READ_ONCE(net->ipv4.sysctl_tcp_min_snd_mss));
	...
}

tcp_base_mss uses plain proc_dointvec with no bounds, while
tcp_mtu_probe_floor accepts 48..65535. Two settings that put search_low
above tcp_base_mss:

  tcp_mtu_probe_floor=1200 with tcp_base_mss=1024
  tcp_base_mss set below tcp_min_snd_mss

Could the text say that the floors take precedence over the tcp_base_mss
cap?

> +	MSS to match if it is larger. Once MTU probing is enabled, the
> +	connection also probes for a larger MSS, as with value 2.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe%40gmail.com
