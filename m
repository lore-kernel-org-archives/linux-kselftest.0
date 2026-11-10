Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292701;
	b=pAKnVn0LIEdrKx5uB4iNo6+yY5vZ4hOiV/9jryH+tdH/QZEpSk0VzJpWOrf/OY5d2VVo
	 1OA9MbFr1wd3Ydv7a7R0VBHBMnXnnG0uXOd4yFeE2VXHFdGreUDKVXvdHmTuWK5F1YBWf
	 cKAbI2SBzFvhggnnYWwp4T6zxwAoK9PeIVmUzlqGo6F8N60eazO7HzYhgNOrlcIflMesP
	 iMzNx9kXubP/E89fdUpxNkW0c0XbrkhQa2qz9f1RLeG14FBBtrJiZj7W1SzfJNEbVVZ3c
	 F3+V2AD6LcuI+WiQmlkaImOI+GXLUqSa1GZcDrFeM13sbuX/5qthjPU9tZGOv8mQncA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292701;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tb6492JbkmgtBmoAA1lWUlcjhbJx5wzf1aKynM8S9Rs=;
	b=2teSafqQRAcCU68dzGT1zoD4+3/0VMcKM6/iRpuLZ9ChLasw5Ox5nf1FmPAB+OtAURPO
	 q3WOd4FTfwqRycvKZBOkVe5FUs7eVpsGvJaMSv0Vyu9rZ6djagNab+ASw+SICxYtlWUIS
	 Bj+IW2f4AdpaG5fIKpPKmolmiRc3vAeHYpn+k8ITgURadJoXc/hPv7wiS+gbR41TG+N9M
	 nJzHn+HMcoEIG+dRzWNiiUfbioNwtOcdNTv+mYl93i5lAcjlF2aa27hK50xQXgqJz3YJF
	 AD7wuOv2ZonybAtUxQaO+QcmUerhZhjnQUylbPx+FRiXfCAmt+wNPobrTvOv0NSzg5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUepMDTX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D5606A334;
	Tue, 10 Nov 2026 06:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUepMDTX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCDB1F008A2;
	Tue, 10 Nov 2026 06:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794292700;
	bh=tb6492JbkmgtBmoAA1lWUlcjhbJx5wzf1aKynM8S9Rs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NUepMDTXMV1qSqxVZiGi7dTMF76kI6beGLfpgFoQm994HjHyQHhEo0pjgyNb2ThHM
	 wXgUiUBUSxufsqt5BE8SrGxyRB43bLWCD0FDyJm0lgsh/IwTQBWro2gI7HS31ZqKoM
	 h3PC3WQLXQkvmm9ZXljjtnJDGhTkoseoweHyUbq7RwzhATQ0OBH8Ko1QTaQHUK4QOY
	 uuAucLUaaKv5yDEYu/APqwUDEbTZlFfg1rtJPmPQjM1jpNf0WZPKfWw0UEHhLdFtja
	 34ytQjEC+WGd2G5jydmujjZnBa1E5CoqJjb1AApTCWEJYMTQE5m2mZUYNZGT8mVCTw
	 Rq1qCSMykbTWg==
Subject: Re: [PATCH net 2/4] af_unix: Fix scm_stat.nr_fds leaks for OOB skb.
From: netdev-bot+sashiko@kernel.org
To: sidchintamaneni@gmail.com
Cc: kuniyu@google.com, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, willemb@google.com, jannh@google.com,
 tkhai@ya.ru, apais@microsoft.com, rlmenge@gmail.com,
 hargar@linux.microsoft.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 06:38:18 +0000
Message-ID: <179429269890.994134.2299928525127713908@kernel.org>
In-Reply-To: <20261106051905.218638-3-sidchintamaneni@gmail.com>
References: <20261106051905.218638-3-sidchintamaneni@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "af_unix: Fix scm_stat.nr_fds leaks for
  OOB skb." gives the wrong reason for the leak.

Pre-existing issues:
- [Medium] unix_dgram_disconnected() (net/unix/af_unix.c:616) purges a
  datagram socket's receive queue with skb_queue_purge_reason() and…

--

af_unix: Fix scm_stat.nr_fds leaks for OOB skb.

This commit adds scm_stat_del() calls on the paths that free or skip an
OOB skb. Those paths are in unix_stream_recv_urg(), manage_oob() and
unix_stream_read_skb(). Without the calls, u->scm_stat.nr_fds stays
elevated after an OOB skb carrying SCM_RIGHTS is dropped.

> Because unix_destruct_scm() has no reference to the receiving socket when
> passed descriptors are not AF_UNIX sockets, u->scm_stat.nr_fds (reported
> as scm_fds in /proc/<pid>/fdinfo/<fd>) remains permanently elevated.

[Severity: Low]
Is this explanation accurate? It reads as if the leak only happens when
the passed descriptors are not AF_UNIX sockets.

The destructor path never decrements nr_fds for any fd type:

unix_destruct_scm()->unix_detach_fds()->unix_destroy_fpl()->unix_del_edges()

net/unix/garbage.c:unix_del_edges() {
    ...
	if (!fpl->dead) {
		receiver = fpl->edges[0].successor;
		receiver->scm_stat.nr_unix_fds -= fpl->count_unix;
	}
out:
	WRITE_ONCE(fpl->user->unix_inflight, fpl->user->unix_inflight - fpl->count);
    ...
}

The destructor can reach the receiver through the AF_UNIX edges, but it
only updates nr_unix_fds and unix_inflight.

The only decrement of nr_fds is the atomic_sub() in scm_stat_del(). So
these OOB free paths leaked nr_fds for AF_UNIX descriptors too.

The oob_fdinfo selftest in this series sends AF_UNIX socket fds
(self->fd[inflight * 2]) over MSG_OOB. It expects scm_fds to go back to 0
only with this fix applied.

Could the commit message describe the cause as scm_stat_del() being the
only place nr_fds is decremented, whatever the fd type?

> diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
> index bfaab7c6d7203..44c0a81dd423a 100644
> --- a/net/unix/af_unix.c
> +++ b/net/unix/af_unix.c

[ ... ]

> @@ -2906,6 +2915,7 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
>  		spin_unlock(&queue->lock);
>  		mutex_unlock(&u->iolock);
>  
> +		scm_stat_del(sk, skb);
>  		kfree_skb_reason(skb, SKB_DROP_REASON_UNIX_SKIP_OOB);
>  		return -EAGAIN;
>  	}

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. Is
there a similar nr_fds leak in unix_dgram_disconnected()?

net/unix/af_unix.c:unix_dgram_disconnected() {
	if (!skb_queue_empty(&sk->sk_receive_queue)) {
		skb_queue_purge_reason(&sk->sk_receive_queue,
				       SKB_DROP_REASON_UNIX_DISCONNECT);
    ...
}

Each skb on that queue was counted by scm_stat_add() at send time. The
queue is purged without scm_stat_del(), and the socket stays in use. This
happens when unix_dgram_connect() gives it a new peer (or AF_UNSPEC), and
also from unix_dgram_sendmsg().

Sending SCM_RIGHTS to a connected SOCK_DGRAM socket and then calling
connect() on it before reading would leave scm_fds in fdinfo too high.

This is fixed later in the same series by "af_unix: Fix scm_stat.nr_fds
leak in unix_dgram_disconnected()". That patch dequeues each skb and calls
scm_stat_del() before kfree_skb_reason(), and the dgram_disconnect_fdinfo
selftest covers it.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106051905.218638-1-sidchintamaneni%40gmail.com
