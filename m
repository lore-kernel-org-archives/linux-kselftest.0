Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292702;
	b=hXsiEwmHO/91SYIPNePxALxPM5gL6ScdWyMljcJpL5WXE6XQ9rFGHIyQ6wxgWEqn6ryd
	 MshmEO/Z9QYGWYUy+mbLIG0ZIBNrigT27N2Y2pWDFy4RSngENxk+s7gYbf1/7q1zZP4qn
	 BP/Y78d9Y2C3S1gTtTm43tCpXQKHWoso974i7wvxuvvUdS5m2W9HBKPGQW8/Y4aM4i9WE
	 H9nfERO21NTIrywLZq6qpf65xBc9PUjKniW1jfmhrxKpdTGtaShMfxmdbL8ldJI3XMz2x
	 5uYUEdTt+//5abh5PI6gNpJTDRzlSL4c+z6HciPbgF9ZkpBpw8fIJZjcBxNf3QwPsSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292702;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RWInOMfw9GOXwISAMEtJFc91329pw/vtCm+j8sow0wY=;
	b=p4GPL+rVQMZhtCJRsE9wAYHeKfY4RrLJdeWZKMWDjI8GTV/emqKWVQrlQykMWX6cjSmU
	 p6gOmr55fz7a9VPqf7FMSdFdqYRu84hmAcd/TQ2ApjK239FVyk8xVAPPkl+1kYRbK6Bge
	 TxOAhKHScg/XpXWrd4xK3n9wwh9EGurtLvpakCFklypI2Q9pMMO8Kz16/KRGo0jqi+AyU
	 3Z//TfMybbIuHNSvE1rl8/mSGeGMqQMcYNt3zLxM4V/eG4MnSO8cw5iuC1/hLrVSJFLW2
	 7w/IryI/7Pli/rUrT3DnhFFkvH+LTIMo+OtkTPHxrZqLjI08JffxCrxVpkts1ZfC1jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYie+R0z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34560A2601;
	Tue, 10 Nov 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OYie+R0z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9031F008BF;
	Tue, 10 Nov 2026 06:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794292701;
	bh=RWInOMfw9GOXwISAMEtJFc91329pw/vtCm+j8sow0wY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OYie+R0z2I+81ZIbGNr/M1bu/c25hL8Rj75oPBcHX9DVaOCUNhDuYgbOcCVmpMNv8
	 oEn0CjFczzgr8VaA5hO1ws3lq9EjlEGomfevhel9DISrybngN/NStF4mywWXtdnufZ
	 gbRLJi6dn/93m/Og791W7CLroZuMlvesU/8FcVnb3BqM0UWABey2uJuUI54CVVbDb4
	 2PRwnZzH/eGWTWg+T5DnzuEv3YsbQLjmDeos3wRJ+yJWXBPBXt+Kea3Z8SPa69j/w0
	 peBW6TxhNNwqGaR/XE4n4ruCEsNzRCu5Gts9GwNSnjmp3j6t/t6OZVRigoTZfIpUmp
	 QZtBwLY64TsSw==
Subject: Re: [PATCH net 3/4] af_unix: Fix scm_stat.nr_fds leak in
 unix_dgram_disconnected().
From: netdev-bot+sashiko@kernel.org
To: sidchintamaneni@gmail.com
Cc: kuniyu@google.com, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, willemb@google.com, jannh@google.com,
 tkhai@ya.ru, apais@microsoft.com, rlmenge@gmail.com,
 hargar@linux.microsoft.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 06:38:20 +0000
Message-ID: <179429270039.994134.15193839988115101095@kernel.org>
In-Reply-To: <20261106051905.218638-4-sidchintamaneni@gmail.com>
References: <20261106051905.218638-4-sidchintamaneni@gmail.com>
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

- [Medium] In net/unix/af_unix.c, unix_dgram_disconnected() used to free
  a fixed snapshot of the receive queue.

--

af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().

This patch changes unix_dgram_disconnected() so that it dequeues each skb
from sk->sk_receive_queue, calls scm_stat_del(), and only then frees the
skb. Before this, skb_queue_purge_reason() freed the skbs without updating
the counter, so u->scm_stat.nr_fds stayed too high after a disconnect.
scm_stat_add() and scm_stat_del() move above unix_dgram_disconnected() so
they can be called from there.

> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index 44c0a81dd423a..47120d81aca28 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c

[ ... ]

> @@ -616,8 +638,12 @@ static void unix_write_space(struct sock *sk)
>  static void unix_dgram_disconnected(struct sock *sk, struct sock *other)
>  {
>  	if (!skb_queue_empty(&sk->sk_receive_queue)) {
> -		skb_queue_purge_reason(&sk->sk_receive_queue,
> -				       SKB_DROP_REASON_UNIX_DISCONNECT);
> +		struct sk_buff *skb;
> +
> +		while ((skb = skb_dequeue(&sk->sk_receive_queue)) != NULL) {
> +			scm_stat_del(sk, skb);
> +			kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_DISCONNECT);
> +		}

[Severity: Medium]
Can this loop keep running while other senders refill the queue?

skb_queue_purge_reason() took a snapshot of the queue. It took the lock
once, spliced everything onto a private list, and freed only that list:

net/core/skbuff.c:skb_queue_purge_reason() {
    ...
	spin_lock_irqsave(&list->lock, flags);
	skb_queue_splice_init(list, &tmp);
	spin_unlock_irqrestore(&list->lock, flags);

	__skb_queue_purge_reason(&tmp, reason);
}

The new loop drains the live queue until it happens to be empty. It also
takes and drops the irq-disabling queue lock once per skb.

Both callers have already published the new peer state and dropped the
unix state locks before they call this. In unix_dgram_connect():

	unix_peer(sk) = other;
	...
	unix_state_double_unlock(sk, other);

	if (other != old_peer) {
		unix_dgram_disconnected(sk, old_peer);

On the dead-peer path in unix_dgram_sendmsg():

	unix_peer(sk) = NULL;
	unix_dgram_peer_wake_disconnect_wakeup(sk, other);

	WRITE_ONCE(sk->sk_state, TCP_CLOSE);
	unix_state_unlock(sk);

	unix_dgram_disconnected(sk, other);

>From then on the new peer can send to sk. If the peer is now NULL
(AF_UNSPEC or the dead-peer case), any socket that can reach sk's bound
address can send to it as well. Those senders reach this code in
unix_dgram_sendmsg() while the loop is still running:

	scm_stat_add(other, skb);
	skb_queue_tail(&other->sk_receive_queue, skb);

The receiver-side flow control does not hold them back:

	if (other != sk &&
	    unlikely(unix_peer(other) != sk &&
	    unix_recvq_full_lockless(other))) {

This check is skipped completely when the sender is sk's new peer. For
other senders it only applies once the queue is above sk_max_ack_backlog,
and the loop keeps the queue below that.

If several CPUs keep sending, connect() or sendmsg() could stay in this
loop with no fixed bound and no cond_resched(). Could that cause soft
lockups on non-preemptible kernels?

Datagrams that the new peer queues after the peer change would also be
dropped as SKB_DROP_REASON_UNIX_DISCONNECT for as long as the loop runs.
Before this patch, that window ended at the single splice.

For reference, the old skb_queue_purge_reason() used the same
dequeue-until-empty form before commit d86e5fbd4c96 changed it to splice.

Would it work to keep the splice? The queue could be spliced into a local
sk_buff_head under sk->sk_receive_queue.lock, and then the local list
walked with scm_stat_del() and kfree_skb_reason() on each skb. That keeps
the new nr_fds accounting and bounds the work at the time of the splice.

>  
>  		wake_up_interruptible_all(&unix_sk(sk)->peer_wait);
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106051905.218638-1-sidchintamaneni%40gmail.com
