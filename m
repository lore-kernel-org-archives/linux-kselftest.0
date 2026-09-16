Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E14E50BC;
	Wed, 16 Sep 2026 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592728; cv=none; b=fNrzk/wwpaiL/5orUtUkUWkBFvp8/Ky81gWHEgKZUn2DIL4fYLR1VeAQZooCuCBK0NGXEvc9v48A9Pvz2UxgOVdnJ2Pia/FKHn+i1prXrZxhK/KFoAFn4xWB3brNQJbmGd9y4OhmSC3xNf32Z5dH5JYh+KPY8W9yWmxUihBn7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592728; c=relaxed/simple;
	bh=GgMal0v6lCqCkUE7M8hD7uXocnll8RhRY+kESz5jnpQ=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VMzzIL/3Xk6gQ4QBVJZs5joDiGuTMHQ8e1wg78Isl3ALAW1AR14NJ4DCfnuOU3l9se9+uvcslf+ihPRIceON522ZloAh6AtSSy3ieQ/i3OnR7R0gstp+mwQrx8H7O1oSq83SBzS+1jZrsnr2FQ49ZYkr+TJOXrJ5B15vmEDz1oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmRFnJ6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmRFnJ6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2301F00893;
	Wed, 16 Sep 2026 21:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789592697;
	bh=EKJTgXY3SAIo2bvT9uMHyLH453cp/F4jk8CcNk2twfQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nmRFnJ6fSpBT2RgvaNUuP1Jen1NrQ69kS6DRfahmKoRW2ztuH+PQjAHYNsH0XwG7c
	 ESYYMM+ck2GqTQ7IkP9WCseey6akQefUeBHIf6syIYFDIxLHC2BNA2Pq65eKx9slJm
	 ZakCFHQHkquL7NmcOMitkpVVeYp/5IauIIZfksJhsh5ygSXtZvB/F4xqexnlz/bVkA
	 xc/ii8IWlIaPp3ADpLfgjlU90/6Z+pWs/9XioyGexNzrH1xIJsRGNbEYTwXBQK+IeN
	 4aVtzrfSV97wqlOjaHpYoYVJiVgYmSMjBu3fcI3dvoIIRcslGv10wIJOnJzyeiEl7y
	 O4mFSlM/N89ZA==
Subject: Re: [PATCH net v3 2/2] selftests: net: packetdrill: test exclusion of
 old ACK from TCP fast path
From: netdev-bot+sashiko@kernel.org
To: inbal.lipshtat@mail.huji.ac.il
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 amit.klein@mail.huji.ac.il
Date: Wed, 16 Sep 2026 21:04:56 +0000
Message-ID: <178959269660.22033.12533704715181509708@kernel.org>
In-Reply-To: <20260914090408.1435080-3-inbal.lipshtat@mail.huji.ac.il>
References: <20260914090408.1435080-3-inbal.lipshtat@mail.huji.ac.il>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] The new packetdrill test
  tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt…

--

selftests: net: packetdrill: test exclusion of old ACK from TCP fast path

This adds a packetdrill script that primes the receive queue with a 500
byte segment and then sends an in-sequence 1000 byte data segment carrying
an excessively old ACK, expecting a challenge ACK with RCV.NXT unchanged.
It is based on the reproducer from commit 3d501dd326fb ("tcp: do not accept
ACK of bytes we never sent").

No Link: tags in the commit header.

> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
> new file mode 100644
> index 0000000000000..32dd9de1d3662
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_rfc5961_reject-old-ack.pkt
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +`./defaults.sh
> +sysctl -q net.ipv4.tcp_invalid_ratelimit=0
> +`
> +
> +// Test rejection of data segments carrying excessively old ACKs
> +

[ ... socket setup and handshake snipped ... ]

> +// Populate receive memory so the following segment can use
> +// header prediction.
> +0 < P. 1:501(500) ack 1 win 65535
> +0 > . 1:1(0) ack 501
> +
> +// Send an in-sequence data segment carrying an excessively old ACK.
> +0 < P. 501:1501(1000) ack 2794967397 win 65535
> +
> +// Challenge ACK; RCV.NXT must remain 501.
> +0 > . 1:1(0) ack 501

[Severity: Medium]

Can this script also pass on a kernel that does not have the fast path old
ACK exclusion?  In tcp_rcv_established() there appear to be two independent
routes to the exact output asserted here.

The route the commit message describes is the header prediction gate:

net/ipv4/tcp_input.c:tcp_rcv_established() {
	if ((tcp_flag_word(th) & TCP_HP_BITS) == tp->pred_flags &&
	    TCP_SKB_CB(skb)->seq == tp->rcv_nxt &&
	    between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) {
	...
}

But if that gate is absent and the fast path is entered, the segment can
still leave it before being queued:

net/ipv4/tcp_input.c:tcp_rcv_established() {
	...
			if ((int)skb->truesize > sk->sk_forward_alloc)
				goto step5;
	...
}

Both routes end up in the same place:

net/ipv4/tcp_input.c:tcp_ack() {
	...
	if (before(ack, prior_snd_una - max_window)) {
		if (!(flag & FLAG_NO_CHALLENGE_ACK))
			tcp_send_challenge_ack(sk, false);
		return -SKB_DROP_REASON_TCP_TOO_OLD_ACK;
	}
	...
}

which emits one bare ACK with ack=501 and leaves rcv_nxt at 501, so the
single expectation "+0 > . 1:1(0) ack 501" is satisfied either way.

Given that, does the regression value of the test rest entirely on the
sk_forward_alloc head-room left by the 500 byte priming segment, which the
script does not assert?  Forward allocation is granted in whole pages:

net/core/sock.c:__sk_mem_schedule() {
	int ret, amt = sk_mem_pages(size);

	sk_forward_alloc_add(sk, amt << PAGE_SHIFT);
	...
}

so the residual head-room after the priming segment is roughly PAGE_SIZE
minus the truesize of that skb.  With the default MAX_SKB_FRAGS of 17 the
500 byte skb lands in kmalloc-1024 (truesize around 1280), leaving enough
room for the 1000 byte segment (truesize around 2304), and an unfixed
kernel would queue the payload and fail the script.

With CONFIG_MAX_SKB_FRAGS=45 (BIG TCP), skb_shared_info grows by 28 * 16
bytes and the priming skb moves up a kmalloc bucket, leaving under 2048
bytes of forward allocation:

include/linux/skbuff.h:
	#ifndef CONFIG_MAX_SKB_FRAGS
	# define CONFIG_MAX_SKB_FRAGS 17
	#endif

	#define MAX_SKB_FRAGS CONFIG_MAX_SKB_FRAGS

In that configuration an unfixed kernel would take the truesize bail-out,
emit the same "ack 501" and report a pass while covering nothing.  Other
PAGE_SIZE, NET_SKB_PAD, kmalloc bucket or debug allocator combinations
look like they can have the same effect.

Would it be worth pinning the path with an nstat bracket, the way the
neighbouring tests do, for example on TcpExtTCPHPHits or
TcpExtTCPChallengeACK?  tcp_rcv_big_endseq.pkt uses:

    0 `nstat -n`
   ...
   +0 `nstat | grep TcpExtBeyondWindow | grep -q " 3 "`

That would make the script fail rather than silently pass if the segment
reaches the fast path.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260914090408.1435080-1-inbal.lipshtat%40mail.huji.ac.il
