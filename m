Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B5226A0DD
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 06:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776492138; cv=pass; b=f4NLaSGVYkc5efIFV7azzxb8PV05ISE7Qi1XyPOT9bUjRWnMAPupLPHXQRlIcw4R2ZhpQjUgym3g5VqpeBy2wtl2rcNxKykbWeuDelfdnNIXzF9o9t9R43hXiKQjqkarOUlxmyoM0qDdJWaZ0Ruxnk1qleXhdzgaCEWgSvFMTHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776492138; c=relaxed/simple;
	bh=+DxAgjOGYsbq78L0ygJnRzmXFkqF5BzidbIYSSplQ98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhSizKgfV6sr/pGqEzipSE6Vla/3OWQqhlYOY5Nf/MddkS3KmBFo9k4bKcQ3lDPuv1gvJySdsCa3qxa3S6UeR0HyqF052SaRxQJxK0DPWeCqL/eSzXoW4K2em3FsFhCChwihDqMAgxV/UU5RfQ8oWKm6nD+N9mE8/vkC9dDmx20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rK84Jq0F; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rK84Jq0F"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8aca4e14411so17192516d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 23:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776492136; cv=none;
        d=google.com; s=arc-20240605;
        b=PioDfD2LqzCUL8WbdUgZpyKKfO6Tjw0UUr9isc8c4wVry2ZmIIvJChSW9jAk9/tTIq
         pcIqoOPbSdJ9ZRTQXz/4kOUgAO3xqsoHvhtFFuqS0VoHF9iQbJxQQPFRv5fvmtODisVg
         ubxQrJ1yLCbnJTqWkuzqyZ3vg9I7hYcQqxs4owci0isXRc1Va+Xddv2507bN5USFrmDt
         oGPf+oDKuWipTR7Ku+M0Y806hFEWcWzBfa+Yk7dTENug0COWoxk07BVXfgFsYihcN9Rr
         XGtwW8JDu4qzCDCgncyGisRyQIHNGwKb6Vjw4dVy+1KJrcSEkisczrL+cOa3jDatoPuS
         pLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8Cw2/LxkFW8q0BKiXupLWBPBKSpdwnTq/LIei0Fzfc=;
        fh=KNXBehZHjyEvS4WnE93dh6ERfrWsD2Nq6LRMAU7sEeQ=;
        b=Oe53cW2pSNRwQPYOa/QnCtj+Mr+FKlMzRWZ5OM4yEQ6Ixk9+kar/tCgHs49fu7kZuy
         z2WLo2T/gwXx5Sorux6Bdcy2/5jF7eOWUTwFwqm8tVoiY90o6chfE1vK4xjTQJ193H/k
         870/wrkV2WRirdgG71LlvR621l7ogaTf1w1crTEDOP4PZYY5AQ9YmzQt51mFTWdPPZjr
         8kB4gF08PeC1eBf2EE73fPFOje5dykUUsDbVCILh9z7dWMM/2VKCzG0fQ6w429tJVknN
         4570m2B9XVkNyy9RNlr35W2VExYyii99taWRkpuVA7oVw3RkmNLSsuuOF78XCsPielH9
         dayA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776492136; x=1777096936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8Cw2/LxkFW8q0BKiXupLWBPBKSpdwnTq/LIei0Fzfc=;
        b=rK84Jq0FT1tYluOd8vbtfXAC10Qs9byzVsz6z0XwZdY0qmt0Q7SDK8sw4Hc2tfiweP
         sXTUgDzb5H8kpMCOGQooa8XvvELGL0txWrO9CP7gyVimrDL6Ov05YAKYABm/6LIuSPm4
         1drGyZdMz6XLmgLVZt1hIpWgF7k0y3bjllAkWiQhxzcO8nS5MMtxMB0LlQNhgdiH6AuW
         dai/E4nVrgioJWmlHOZWXUp5CPOEUTxLgUYj0g/F455C4jcQTh6gQOQbb7nLvUqIMzGf
         wjXiCigFI0iYIWyTyG2iBG0QPUeNP3QSzDfi1rCp5Kr78IXp9RWZ5l1kYFHmT99su8Md
         ESDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776492136; x=1777096936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8Cw2/LxkFW8q0BKiXupLWBPBKSpdwnTq/LIei0Fzfc=;
        b=Szco1ROp6rVONELXfeZ6nqEN11ECD6YE6BcgvFnMPgT+1XOY5uzl/MvhYDabeoliMY
         Gs9A83pBqYSGB7+wsOgMf0nTGF3rO3uzGfCf3ESkID0/pkXVSMQ0yN3VJV4uwouchZ/N
         L4UMKy/m5q6xxtpY+QdVUp32LNze+YRphKrDMWZDDxLWTmGH8gN2UEG8ftDRbA+PQxfX
         SXN+ptXZARb7Av/nQ4lgC+DD/DS1kGxvS9TAKnYpFZ3fDZgOAKYrjfR6yz5Nxzpmei9z
         4Smi1b2mffUw/J4WE1ZxDjy2bA9Gbg+Esdh/8p83YE+OIdxHi20HaVPL87PkrcsY0e3t
         JI9A==
X-Forwarded-Encrypted: i=1; AFNElJ/4NJC7WA+rOShkyeYKPand7tQSiTq3cY/kq1bTmvgLyyyK/QEQP/npHw4XS+ZUQQYM2H+TJapmyjGUz4yy8Vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDcvHwcqqmBZhMueiYaVyy1zrBDOZR9c+C6/Smrw21JrkGrTYI
	LK08wmrOAkN1Ba0Fon4XE7+gvUqY3Z2PGf1davhQ0X/yot/sWhAWgA0ewq6IR7mtGoznu84JKRL
	M3ccdSP3GZGEBv4wjPPWPbxH50UWU2ePFcE2u0HSI
X-Gm-Gg: AeBDietqA9XH6w1yqHTk5R82/XWF1F+WvIDjIIhQWkknRpCMFD8WmHAlqsOtJLR0pZ7
	WwE8QmVRH3jfbTEXFCbSXB7FtpWPGV36hpS0M3JNeZGfLku/52fNX2ibx0Nrq/Gk9E07c4oAVGk
	dYj8Awutxl5l0cJY/mdDL/F8Vlx9GZfrb+h+jc48pbHD1Sy5qUD6/A5lh0e635rVZyHhww8kgit
	1BFEU8IiutgNCHUwRl+jBYrG+iloj4UXNkPKfRrUiBNY+YT++/6kgjVStZ4gDoEQ2IPZ1UyXFEC
	qe3KG6weELJYrfLObT3Gkk3HTVTZuYYioBDz+Qg5MmEvVCejY/ZCaijEyLQ3O0pNlYBqztRQfAf
	FKYwKh1KV
X-Received: by 2002:a05:6214:4e14:b0:89c:eabb:f58d with SMTP id
 6a1803df08f44-8b02813b256mr81180536d6.47.1776492136072; Fri, 17 Apr 2026
 23:02:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418041633.691435-1-jt26wzz@gmail.com> <20260418041633.691435-2-jt26wzz@gmail.com>
In-Reply-To: <20260418041633.691435-2-jt26wzz@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 17 Apr 2026 23:02:04 -0700
X-Gm-Features: AQROBzA36i8s0WTRa6QsFOr6av2JTG94HxbtoID-4rUHJyFb0GkqUURu9fQz6kk
Message-ID: <CANn89iJOfDB+5oORjWPbP7Z1SyqUhMzVR8u8i+8P8MPDgg_EGA@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: call sk_data_ready() after listener migration
To: Zhenzhong Wu <jt26wzz@gmail.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tamird@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 9:17=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com> wr=
ote:
>
> When inet_csk_listen_stop() migrates an established child socket from
> a closing listener to another socket in the same SO_REUSEPORT group,
> the target listener gets a new accept-queue entry via
> inet_csk_reqsk_queue_add(), but that path never notifies the target
> listener's waiters.
>
> As a result, a nonblocking accept() still succeeds because it checks
> the accept queue directly, but waiters that sleep for listener
> readiness can remain asleep until another connection generates a
> wakeup. This affects poll()/epoll_wait()-based waiters, and can also
> leave a blocking accept() asleep after migration even though the
> child is already in the target listener's accept queue.
>
> This was observed in a local test where listener A completed the
> handshake, queued the child, and was closed before userspace called
> accept(). The child was migrated to listener B, but listener B never
> received a wakeup for the migrated accept-queue entry.
>
> Call READ_ONCE(nsk->sk_data_ready)(nsk) after a successful migration
> in inet_csk_listen_stop().
>
> The reqsk_timer_handler() path does not need the same change:
> half-open requests only become readable to userspace when the final
> ACK completes the handshake, and tcp_child_process() already wakes
> the listener in that case.
>
> Fixes: 54b92e841937 ("tcp: Migrate TCP_ESTABLISHED/TCP_SYN_RECV sockets i=
n accept queues.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>
> ---
>  net/ipv4/inet_connection_sock.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index 4ac3ae1bc..da1ce082f 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -1483,6 +1483,7 @@ void inet_csk_listen_stop(struct sock *sk)
>                                         __NET_INC_STATS(sock_net(nsk),
>                                                         LINUX_MIB_TCPMIGR=
ATEREQSUCCESS);
>                                         reqsk_migrate_reset(req);
> +                                       READ_ONCE(nsk->sk_data_ready)(nsk=
);

I think this is adding a potential UAF (Use Afte Free).
@nsk might have been freed already by another thread/cpu.
Note the existing code already has similar issues.

Untested patch:

diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_soc=
k.c
index 4ac3ae1bc1afc3a39f2790e39b4dda877dc3272b..287b6e01c4f71bfec3dd2a708f3=
16224d9eb4a64
100644
--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1479,6 +1479,7 @@ void inet_csk_listen_stop(struct sock *sk)
                        if (nreq) {
                                refcount_set(&nreq->rsk_refcnt, 1);

+                               rcu_read_lock();
                                if (inet_csk_reqsk_queue_add(nsk,
nreq, child)) {
                                        __NET_INC_STATS(sock_net(nsk),

LINUX_MIB_TCPMIGRATEREQSUCCESS);
@@ -1489,7 +1490,7 @@ void inet_csk_listen_stop(struct sock *sk)
                                        reqsk_migrate_reset(nreq);
                                        __reqsk_free(nreq);
                                }
-
+                               rcu_read_unlock();
                                /* inet_csk_reqsk_queue_add() has already
                                 * called inet_child_forget() on failure ca=
se.
                                 */
