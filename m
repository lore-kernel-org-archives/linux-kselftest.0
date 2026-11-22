Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382797;
	b=eNw+tVPoad3X9CCWDYRw1bKi86mD+EwK8IekktQiGtxRMUkv1y+4q5mmFWE5Y8ffSy+z
	 KOS2CNIEZlVyv6VUhPv27fK1nHzwlZ3hxNU0dqU072pceQjSFAxPaEvRVZ8VCmRiTkspH
	 HKZNWN5OzelwrBeHRaNQOC3hZ1i4YCGBtp1sKm/owSe0QCQEc4N/Pkcj8M/PgUZ3F9gQT
	 W0OYy8sUVzOpoNRBUrhl02NmsovkAmNIvAV7vdo8frdiMpuuXbuI++EAyOvRaRRMbmZmu
	 HajgHvfcbbt5Mb4f/qDP8eKrF2HNmrfjxCE0o+1aF8ehe1L4p7mINWDGe8RE1g0K+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382797;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zDkNd/IWhSnULT+KvqUUgCRMP4X1FHRb70XY3l6zLiw=;
	b=X14bzWIFriALguZpBA/WN+ysEbZGq5zle+dwzd7xdRW7HLhSF/17OgI/OWQ8Iq34SemC
	 DT2jOCUk8gfjiL/KXRxqd6NTR0wHLBtURFCg1bv8ynqARA1Abu7u+AP/1jx4sWMawTdn1
	 um2wvHVqR498H0H7/QvxW6eK6Qn4hZxQpxwVAxZu+dIpqQHnrdVmVi4Jv8MZaPbZPSNx8
	 OP+7AHqkrhZWBCuiMzlRIBalOqV6y3OHANmWOmtMfEcn30TT3zLTcyaIoD8KLH2RoobSq
	 tWMUSmAHtUD8LGFryX7NkaUoafWrJDeyP2pE3GgNurAW2WdozGssyWdxhDMmgX6OmmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kWNJpJbT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818F0606A31A;
	Sun, 22 Nov 2026 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kWNJpJbT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C831F000CA;
	Sun, 22 Nov 2026 21:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795382796;
	bh=zDkNd/IWhSnULT+KvqUUgCRMP4X1FHRb70XY3l6zLiw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kWNJpJbTkbddwCAK7kW3l4EWCa8AQRcJpL+RX8sh7ZIAvWLrH5Y1Y1hdrjkUYEXej
	 u77Cvh0rRfNY9gsTOA8f2ozgOh+TWYLGNfdfGKV8BPUHpZmNJb/JeDvwyeBbPnWo5w
	 LBoypvZmCWnnc6MFFX49whB8IrbPaDY8Zy433kKjoVzk66aLWupTnd2wvhK6PRid2q
	 Sw21kho76+bPoiQV4AI+MqyFclViCyvCFk6HC5tMudKYMLM79Ts/BWWpdvd/0g9gTi
	 vN4EtCoON9B5nwjauBIie7X0a4eQrGWx5vDsJWMGQsCO8XWHiHIakZgQHVh9QbpWf+
	 OJ9wDo32b7LAQ==
Subject: Re: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
From: netdev-bot+sashiko@kernel.org
To: v0idpwn@gmail.com
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Sun, 22 Nov 2026 21:26:35 +0000
Message-ID: <179538279534.3135.17423952957860887247@kernel.org>
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Lost wakeup: a KeyUpdate that is moved onto rx_list while
  another task is polling stays hidden from that poller.

--

tls: don't hide a queued KeyUpdate from poll()

This commit changes tls_sk_poll() so that records already decrypted
onto rx_list show up as readable even while a rekey is pending. Records
still held by the strparser stay hidden until the new key is provided.
The documentation is updated to match.

[ ... ]

> diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> index b8d5a843f7617..4c4c2801ae065 100644
> --- a/net/tls/tls_main.c
> +++ b/net/tls/tls_main.c
> @@ -414,9 +414,9 @@ static __poll_t tls_sk_poll(struct file *file, struct socket *sock,
>  	tls_ctx = tls_get_ctx(sk);
>  	ctx = tls_sw_ctx_rx(tls_ctx);
>  
> -	if ((skb_queue_empty_lockless(&ctx->rx_list) &&
> -	     !tls_strp_msg_ready(ctx)) ||
> -	    READ_ONCE(ctx->key_update_pending))
> +	if (skb_queue_empty_lockless(&ctx->rx_list) &&
> +	    (!tls_strp_msg_ready(ctx) ||
> +	     READ_ONCE(ctx->key_update_pending)))
>  		mask &= ~(EPOLLIN | EPOLLRDNORM);

[Severity: Medium]
Can a poller that is already waiting still miss the KeyUpdate here?

tls_sk_poll() takes no lock. The KeyUpdate only lands on rx_list at the
very end of the tls_sw_recvmsg() step that decrypts it:

tls_sw_recvmsg()
  tls_rx_one_record()
    tls_check_pending_rekey()
      WRITE_ONCE(rx_ctx->key_update_pending, true);
  tls_record_content_type()      /* returns 0, record type differs */
  tls_rx_rec_done(ctx);          /* clears msg_ready / msg_announced */
  __skb_queue_tail(&ctx->rx_list, darg.skb);

A tls_sk_poll() from another task can run between the point where
key_update_pending is set and __skb_queue_tail(). It can also run in the
earlier gap, after the data record is consumed and before the KeyUpdate
is parsed, when msg_ready is 0. Either way it sees an empty rx_list and
clears EPOLLIN.

Nothing seems to wake the socket after the KeyUpdate is queued. The
deferred wakeup in tls_rx_reader_release() doesn't fire in this state:

net/tls/tls_sw.c:tls_rx_msg_maybe_announce() {
	...
	if (!READ_ONCE(strp->msg_ready) || strp->msg_announced)
		return;
	strp->msg_announced = 1;
	...
	ctx->saved_data_ready(strp->sk);
}

The same reader already consumed the KeyUpdate from the strparser, so
msg_ready is 0 at that point. The only other wakeup, in
tls_finish_key_update(), runs after userspace installs the new key.

One way to hit this is several threads sharing one level-triggered
epoll instance on the TLS fd:

T1 gets the event and enters recvmsg().
The LT item is re-queued and T2 is woken.
T2's ep_item_poll() lands in the window above, gets no events and
  drops the item from the ready list.
T1 queues the KeyUpdate on rx_list, returns the data and calls
  epoll_wait() again. The ready list is empty, so it sleeps.

No task reads the KeyUpdate, so no new key is installed. The connection
then stalls until the peer sends more data. That may never happen if the
peer is waiting for a reply, for example when update_requested is set.
The same wakeup is lost when a poller thread signals a separate reader
thread.

The commit message says:

    A reader that waits for a read event before each recv()
    never reads it, never provides the new key and receives nothing more.

That fix seems to hold only when the same task polls again after
recvmsg() returns. This matches the single-threaded LT reader described
here and the selftest added in "selftests: tls: add a poll test for a
queued KeyUpdate".

Would it make sense to also call ctx->saved_data_ready(sk)? One place
would be where the KeyUpdate is queued on rx_list. Another would be in
tls_rx_reader_release() when rx_list is not empty and key_update_pending
is set.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6%40gmail.com
