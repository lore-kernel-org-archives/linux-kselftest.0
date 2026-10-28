Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793204291;
	b=WDWVO0tNEOVBBJ8JeG7I7FYkkPLQjJkzOnUwEaVyJWyCO8I3TZ93XgKBUeNf5mTEoIoc
	 16oc3r+h8ciFPm2e5lv4qUgG8AVFd+1siWv+XgQKNkyrWILvh6dgIi6hDy/hLYsDuvPYQ
	 NCWUl4M3nsOY4pHGFmr/P02aZF1rSR2orROM2KHD8zOh4FuvhixW7807BktVa1GnA5Vqq
	 KZL/PaUl5vM++DNSjwJNA9UrGcyg8P5Wa/Hf+rWWVIJcvmNEWA+6iq4GzR25lDvk5a70I
	 8RmXfwPFj0MUq/Z2ZRpzX9Pps6UzE9jZT/9je22eYYpuO9lRnIrg/281+uqwAe9wM7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
	b=fj51tWIHcVL8Y5nMcS+vjGtzQCz4xd4H321JpUGTdelrMVz3WMQYJODULao3cVkt72yb
	 IZXbQO7V70IcmMKgGLhQDqNiWzRvIGToM1+oTj3oNMJe59aWqzPVIUV1OOqPkGdE7+G4m
	 1xpxFVBzRRTVWD2R+i2mkGiQFqMb4j58zbv1QF4HA9Cdy8mZ3TXN0QcST19xK6CenPU2Z
	 Ii/Yr6O2zJnOCn6w7elqC9q6X7AyUpQlf0ZAqSLDjmGozdln/J3fQFBProQYns97YWZVM
	 yOmqrt6x3ybqupO4ng/n7LDjJD8gm+c1IyqOnVY6zBoLwqM8HoYT9lIzBvBgwI6tp8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nhcyRhRU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77AF606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 16:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77AF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nhcyRhRU
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so11924a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 09:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793204289; cv=none;
        d=google.com; s=arc-20260327;
        b=iae5Q/cpVnsg4BFG2r+rVD+YHC+WI8aUY10ZtiPgtxlatpCdeZoUhFtehLOpdrbAK5
         K1wKZN47AdhJCyBgXCeSRyAfPzLu7U9w6CXh8MTfEXP0W6Scx5zxudAlyd48hNZoxCmZ
         F0mP8l3Y2uxMQC5o+08e0ayBKt9f1thp4O5zlPvgPn/9G+OYvM3LyOV8zdSV0Yon1hsx
         o6712WRi9kLtDiY5YQ/+Pf6RyOeii/Kw9Lpn4HtdUEjb/zyGg4rMSp5SmOGzeLsdi97b
         xkb7UFngz+889K+4EuvLrX7CxntI2vHIPjIqojJSkOoCKNYXf/xmopeiUuavp4DKTZBR
         xYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
        fh=vwlsyU9U5IzYaypkP6bQsM+QdEKWzTV39Mj+ooLnGoM=;
        b=ij8gLGjofa43RDeYytzdCu1AxxU2WC4EBB7Q7Pj39lwuntAbgVkU2R8Hmz8SvNunll
         4iXJ0BO6jBVY6SRv2K057qKruIEtVuxHJUOTiS5sQZKWEQbQWYy/14Pvz26ijGCRXNY3
         H5hJejwO9jWURwocE1yiBwEbzVSzheyobFa/eg8c5I0I7l5l029jtYJrenjx/Tl6KBQZ
         z3JmMUlnIHxGY60ZNbyU7JZ69AmIcpLanrxA639bwnOXPBuvldxaRlEQceCgceE7gW7p
         uFPjnLuM0Zj1QkfZ5FSOSzHBN73vycFM+cjLhHwkOHj5600DncJp4YGlUVbLHIOibHy6
         SM+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793204289; x=1793809089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
        b=nhcyRhRU/4RNzSMLzZT8e3LWTesK3fZyuVFJL1mpIE6Nw3t+DdqE3iRINLZRiiRe17
         2Y87u3lO3aIl39AqO+3cbBfoYWF7xbM1p/9jrzEk1iFcDqZSjzCh6v4BtWI+MQpjt8/n
         a9N2CnZOXZMDYD6cCzKQBiK1LbdmvghCVwzWoRzbQqCrVFDQU8njfQ5WSoSKKPDnlcH+
         pAnE7Nb8qgHILbh74wXmrh4vXUn+V97thRbE3NV4OIzAWlf/QxUpl8W2CuYKwlBvhcVQ
         5hjiEXtyz7U/vn+m24FpYbQVKesS+Holi3yILWVMKD4ia2PpNuHSgq03eFGpRgsR0hGb
         EhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204289; x=1793809089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
        b=LuX/pckUZNUuDjgcejm8p5fXScLRWho4iTLs4yrOrGGzKrsRD+7UJzO6H8x69UzK7R
         +UdI5OFExtVhl2TzM/2ZhISvqWM7NIZbCtmjq+5WNmEYqJmKQmhwmSoXtTrHXpKnnvFX
         y5theYgX6S1sBjTGF7kS4+bMRoOyAkiH9L3XkKGIf48hA7Lojwp1pL3ObDe+SutxYlCv
         kemHRt1aw+MpbTQe5fOTOEAjSxJSbO+ao+DZDa52fOsx04pwfh9utuRPtNgy6AF0s9Bs
         3Va9re5WN9uupWhn+3II38m79vvE004/JaP1cz8j3TtY9XXoS8RehdhzyPcEFlW39Ki+
         3sQw==
X-Forwarded-Encrypted: i=1; AKwUvBy1qaWa3CCbUkXmTrFY3CWoXFHGx6niB62zYNo7ZwuXsjQHcLlaR8rpE3rEnAm3dh3D760XtL+Fbb1HmLDCp/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdGix0Ji7zJAszt+ttDNpPnaR0pWadjZPmwk1xB8XZ0m26Tv5U
	Io9YeQuZpTJ49az3U0UrpTOazprtwJ9uuPuIjxaQLhHgvWmVgEjyQ1dggz7cnMLz+gsA0mxdmKy
	xp6e+HeEMmcjyaSzZtRo+OdiZM4HBnJjm3Femlh/K
X-Gm-Gg: AYBFou3/HvKglMsOnXWhshljXg6u1v/XpwQjtUUidscE3zC9gycJQtaFI6X3kUgh4g6
	ds8Qv2G3xX/3+spZwoTZXqW4lcizX/Ye00/MiIU/KXpiNGmkpkFmpO4VLAMPCw2WIZxHLH5O9wF
	MHTfNASldKd/s29yhqixOWqP0BPFFoZIEJIQIA/3FyDS/MXWfhLIDnqy7dxnx1ZO61bKl4rpo8K
	f/Eay5w6IP9Z+xgveFCuy11g/KuOCBly44S9hLIeFoNrOurTgH5iGugKQLNjuQdCYvaaaSpEasK
	Egk1kjX30jeTw22UJhZRMDa8wIBo4Ic5AdCq2qc9PFKSJp8vTdjTvoUkpyVtz9k5adDQR4cdkd9
	TB3LrjSm3wTqSqqc0O/4he02tsKlcPd3C2wBQiVl4mVTv+dMELuEObOchpYc9VipLAjv3RS8=
X-Received: by 2002:aa7:d516:0:b0:6ae:1503:5a27 with SMTP id
 4fb4d7f45d1cf-6b49b872a5fmr89061a12.8.1793204288568; Wed, 28 Oct 2026
 09:18:08 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com> <20261026032216.1145201-2-tavip@google.com>
 <CAL4WiiqQ3cychvCccpNW+WOU2SYCfNt6L=wgPkNmfTLHLy605Q@mail.gmail.com>
 <auALgSUuoYmfKSz3@google.com> <CAL4Wiirpss0inrC7gKhsNfwUO-KGZ-nnF5h7N8jXS9qziiSW4A@mail.gmail.com>
In-Reply-To: <CAL4Wiirpss0inrC7gKhsNfwUO-KGZ-nnF5h7N8jXS9qziiSW4A@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Wed, 28 Oct 2026 09:17:55 -0700
X-Gm-Features: AclHuK8w5lO8If8x36ZOhT6j7gK1cagODxrbPfh_JsvNFfuijHGsG2Hl4-fDuR4
Message-ID: <CAGWr4cSmbe7nuobWAZ9A2yV3BT0OT3CKhaBS5o++b+10srvjHA@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] tcp: clamp return value of tcp_wmem_schedule()
 to non-negative
To: Eric Dumazet <edumazet@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:20=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le mar. 27 oct. 2026 =C3=A0 03:28, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > On Mon, 26 Oct 2026 13:06:56 +0100, Eric Dumazet wrote:
> > > Le lun. 26 oct. 2026 =C3=A0 04:22, Octavian Purdila <tavip@google.com=
> a =C3=A9crit :
> > > >
> > > > When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> > > > sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> > > > tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
> > > >
> > > > However, sk->sk_forward_alloc is a signed int that can transiently
> > > > become negative when tcp_collapse() re-packs partially read or high
> > > > payload-to-truesize SKBs in the receive queue and charges newly
> > > > allocated SKBs via sk_mem_charge() before freeing the original SKB.
> > > >
> > > > If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked=
()
> > > > passes that negative copy length to skb_copy_to_page_nocache() ->
> > > > copy_from_iter_full() -> check_copy_size(), where it is converted t=
o an
> > > > unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MA=
X)
> > > > in production and returning -EFAULT instead of waiting for memory o=
r
> > > > returning -EAGAIN:
> > > >
> > > >   WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249 tc=
p_sendmsg+0x10c1/0x1530
> > > >   Call Trace:
> > > >    <TASK>
> > > >    __sys_sendmsg+0x292/0x490
> > > >    do_syscall_64+0x88/0x340
> > > >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > >
> > > > Clamp the return value of tcp_wmem_schedule() to [0, copy] so calle=
rs
> > > > treat negative sk_forward_alloc as 0 available bytes.
> > > >
> > > > Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under mem=
ory pressure")
> > > > Assisted-by: LLM
> > > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> > > > Signed-off-by: Octavian Purdila <tavip@google.com>
> > > > ---
> > > >  net/ipv4/tcp.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > > > index 87ef6d5cbfeba..0e062fcd94a6c 100644
> > > > --- a/net/ipv4/tcp.c
> > > > +++ b/net/ipv4/tcp.c
> > > > @@ -1037,7 +1037,7 @@ int tcp_wmem_schedule(struct sock *sk, int co=
py)
> > > >         left =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_wmem[0]) -=
 sk->sk_wmem_queued;
> > > >         if (left > 0)
> > > >                 sk_forced_mem_schedule(sk, min(left, copy));
> > > > -       return min(copy, sk->sk_forward_alloc);
> > > > +       return clamp(sk->sk_forward_alloc, 0, copy);
> > > >  }
> > > >
> > > >  void tcp_free_fastopen_req(struct tcp_sock *tp)
> > >
> > > I do wonder if the following fix could be better (no change in the fa=
st path)
> >
> > Exactly, this looks better too, we can avoid negative
> > sk_forward_alloc and clamp().
> >
> > The packetdrill will need to be adjusted as it triggers cgroup
> > OOM with this approach, or we could defer the test to net-next too.
> >
>
> Let's defer the test. We also have an upcoming fix for tcp_collapse() any=
way.
>
> Octavian, could you resend a v5 (sorry for that) ?
>

OK, no worries. I'll post your version as v5.
