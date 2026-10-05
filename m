Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85B9447807;
	Mon,  5 Oct 2026 23:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242547; cv=none; b=lqKgx2qDR1vVpJnRdsPJdFfZfLzHOBPG1lUpWUoiWodCqsYfspGcedlhnkHSbxiTwX1CE7MtdqXTLbVoQjJD9RsYBQfjkKH14YckevF740ctJ8gQ7CVqZJeYBNHMd75Vx0m8InDLSv8ZCuvBrVHoR2Tna5Y4S0c/fdC5LN8fCfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242547; c=relaxed/simple;
	bh=pXy4a7uXeA0FnScTjJrwCz7qwPaAYuFJjUmZuI0pj4o=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tncUpqpAGYVWUf+QpGyszooKuBX+XgK41NOhYN6yVla6993FMxKv4XNFso4EWNztNDJsNPxYnWSY6qIgV/bynUn/zZaRl1a0I1QwoXpSYK7an0f3Jkovc7EbarQRGQdTJebDi0tsPDvLkPKAdkfz/C7eH7hVks49ASGLJmn+9zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDeTxptb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDeTxptb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AA41F00893;
	Mon,  5 Oct 2026 23:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242546;
	bh=K77/D+4At40Fbqlfys+IF+KUoY3QWI67QAOSz43d3jg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fDeTxptb3l2wFug0bZbqltnNdgbKHVDVEppi7fJzfwvk9wqDgl+9kF1/GUYNQrqjW
	 bacAfhTiSJFZV9wMPu1rKYo3AKsCMgmG95YhmVL4hRH8K2NqgqxqtkLxS2Ns2zXLZx
	 Nhag90bsmnfDtdhRBVzPuX7ZOtOENNjhQWHeia/TMPQgOKTuuKOd0ydMFNepD8wjC+
	 LTePo/y69uyWsCB+6Zs3fySCuq2J5BWEp6FDna1cw1w3b8fI73GPwIynQ9FGe+UBqO
	 sxy5rVOwc64cJAMjJcL5rpJk/SiyjJXyVYx0Ik9284tB62Wxo8SeXGdeKG/cQnBOxI
	 osG1wuGVqT4ww==
Subject:
 Re: [PATCH net-next v2 4/8] tls: honor O_NONBLOCK in tls_sw_splice_read()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 05 Oct 2026 23:22:25 +0000
Message-ID: <179124254543.434549.15179245104274598626@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-4-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-4-2dd1947bb642@kernel.org>
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
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the poll-then-splice stall goes back
  to c46234ebb4d1.

--

tls: honor O_NONBLOCK in tls_sw_splice_read()

This patch makes tls_sw_splice_read() treat the socket's O_NONBLOCK as
nonblocking as well as SPLICE_F_NONBLOCK. The combined flag goes to
tls_rx_reader_lock(), tls_rx_rec_wait() and sock_rcvtimeo(). A
poll-then-splice loop on a nonblocking TLS socket then gets -EAGAIN
instead of sleeping.

> Poll makes the sleep reachable. tls_sw_sock_is_readable() reports
> the socket readable while any record sits on rx_list, including a
> zero-length record that delivers no bytes to the pipe. The
> strparser announces a record before decryption, when its plaintext
> length is unknown, so the readiness test cannot screen such a
> record out. The splice consumes it and waits for the next, and an
> event loop that polls and then splices stalls every connection it
> multiplexes.

[ ... ]

> Fixes: c46234ebb4d1 ("tls: RX path for ktls")

[Severity: Medium]
Is c46234ebb4d1 the right commit to blame for this stall? It looks like
the previous patch in this series added the poll-then-splice sleep:
"tls: consume empty data records in tls_sw_splice_read()".

Before that patch, tls_sw_splice_read() had no retry loop. Also,
tls_sk_poll() only reports EPOLLIN when a record is parsed or rx_list is
non-empty:

net/tls/tls_main.c:tls_sk_poll() {
    ...
	if ((skb_queue_empty_lockless(&ctx->rx_list) &&
	     !tls_strp_msg_ready(ctx)) ||
	    READ_ONCE(ctx->key_update_pending))
		mask &= ~(EPOLLIN | EPOLLRDNORM);
    ...
}

So a single reader that polled and then spliced would either dequeue
from rx_list or reach tls_rx_rec_wait() with a record already parsed.
Either way it never slept. A zero-length record gave a false EOF, not a
hang.

The previous patch added this retry:

	if (rxm->full_len == 0) {
		consume_skb(skb);
		...
		goto retry;
	}

On retry, that patch calls tls_rx_rec_wait() with
flags & SPLICE_F_NONBLOCK. That value is false for an O_NONBLOCK socket
spliced into a blocking pipe. The wait then uses sk_rcvtimeo and sleeps
until the next record arrives.

This creates a bisect window between the two commits. In that window, a
peer that sends one empty application_data record and then goes quiet
can stall a poll/splice event loop.

Both commits also carry the same Fixes: tag. The earlier one applies on
its own, but this one rewrites the earlier one's signal_pending() branch
and can't apply without it. A stable backport of only the earlier
commit would turn the false EOF into a hang that a remote peer can
trigger.

Could this patch go before "tls: consume empty data records in
tls_sw_splice_read()" in the series? If not, could this commit message
say that the stall depends on that commit and that the two must be
backported together?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-tls-follow-on-v2-0-2dd1947bb642%40kernel.org
