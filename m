Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D002DC32A
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 04:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773205059; cv=pass; b=QzjLwvYE40WK1vRn6peJGcLAUi+evVp3PAbijnvhBMYfUA9Zi3SynchikH70qKdrbl7jnVt7YH0r216zcUwt5W5eb+ckAGygn40PUthxPoIELbnqZZfV5bVut17weHJ0/8V1VTXIiArNGiq4z113TSymMufQE6548jm0QXuD5uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773205059; c=relaxed/simple;
	bh=tQUkS47wbxvGDRbtPbZgzsO0VSZeaXsZKqGOpWvmQkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2nQ6Y8U59n/U9VKZ0b11FodfQeiSirG2OYLNQNJWxO4n6DK5xZneytMPOr7AhnvaBLmVhi8gQ+KpWP9rfCntcHflR0taq0pTWiiTqBn7l04m7LwP22yONz/IpgCBzRA/OYfn25aEHDCeC1DgLeh2+9c7E/o5YqrjmGjvnL+p9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fWiDsEEi; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fWiDsEEi"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-127380532eeso955162c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 21:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773205057; cv=none;
        d=google.com; s=arc-20240605;
        b=i8sIrzMxexK66RP0dLXp4HcXNjR20Yr8ZL+Gs7XHF3Ow//SAzLGxOeKcw+uuPUoTLH
         HsaYHQ8tW3tHlH/iHjnjls8zHzRNgBdH0x0POmzLrwoe6Ftz/bkvZt4JJNnsvdG5m7H2
         n3BpE32AoZdL68hPSAg6kwsZ5kH9pNko7sR2AVebCxHUcgGN5RtTpDJ9xyJ3j4AY5t/i
         akbp9PawV5WxOyQFcnNir1yArxoDdlS/44d7D+eCsYN7duW6l01GdMfF/kMJi4NLAQsH
         zuKGG11b5sJNhsn/IZrnItZcXft6bxSiJ18xZKqHM+VYfmySZFA+HKZbC+9+xsHXsXeL
         7nrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ag1Q7iiQTmW1LyMcYibmgdn2+ZlfPyr/1PUridSt8jo=;
        fh=0PX2IEeFxvDy7Ixv5cLySqCS3l2JwX+t4H6eYVy6x7s=;
        b=Crsyuly0Ab80rYu/lq+yWVgTlsPW07HhVZ9tsKcqF5sHzj1OV75Tur3x3nnTHbTcAL
         /pUJ2IC09fPi2EDlrSaJcKutIXFSlTaXDkDsJ7i0nou6Ocr0ybFgBdW5rqCI6wQzncyK
         rApbkJyKp3fWHB/XV6yotzhmijm+rHU09kS3C+ETsdXU0JmpulArcLRSp6wNcRa4Bqjg
         tuytPwfw/LBEMBk+HApjItMeOzu96pRJFA4qYbrzep7x3JSFd8+BlPjy5aDplBQQDeXK
         sOU72SHZmqEgvZUgO09faO0+GUajSHHZJ+3G1HhKSIDGU7IKfUc0zTkBEqUVtUbqU8kf
         xRow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773205057; x=1773809857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag1Q7iiQTmW1LyMcYibmgdn2+ZlfPyr/1PUridSt8jo=;
        b=fWiDsEEiurloA2OPu/hA7DT4oA/Ty2jTmRrMNCl2H4+/oqq1o6x3oupb8fX4g7DJ+R
         K0lnaOXOnjNJBUf7mfiCkj+i/lusgOF/kwTlESfhj/FT/9+bO/fgYZXpnPKG37SHHSTW
         bf1nN/0VfsgITSYaxC5MTtAOchHoAxZkyddT4m5lRxtWNXVL0LUhKK9QhAmwXCIfMi6+
         GIwFOVWmkSvW0+gd3Pxr6cdHKhujg67rymMHtPd3ql4A6HrXEdH9ywwgANcLa6uSAqj7
         JZrOrEV0/PhGa49U7GCVGKgybiJt6A8cV+YqUmgWx2yG3R7kv4sm+LOdKiix+16vMDaZ
         M08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773205057; x=1773809857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ag1Q7iiQTmW1LyMcYibmgdn2+ZlfPyr/1PUridSt8jo=;
        b=DjBHoBY+fD2Sf85PxQV4QqDkclURkTqQe6EUoAUGIk/QfgeUOeofKDdYF37mWK5ltx
         m+/DTp+yYkRSAYGewiIAc7DgfjR1eD7jLZ2yZv9OjzaheMb/JZWq0TY3/TmnnFwYsH7d
         pfqOUCiTbGnXOkjKjh75yQix5I/lIsMxvCYL+OIx3wJf6d01wEpFOKTDbiuyEGyvYVJo
         yho/aGDB1pCtgtCkxdfi5GxbMW9Fuo7yEZslRIUcqfSfNGlcdoJvPyNPhp2K0HqxxKFw
         69ICsLoEZBAzihjMF32p8NepgDZXegdcX7vFOuvkRshP2aDLQh1oYIa3vvDLeGEuWh3V
         KGng==
X-Forwarded-Encrypted: i=1; AJvYcCWkriDvzb69c3JH0jSEZjpzBM1zSRuz45C8hjg+sHTJcuuk2hCrtxtn5McEcwFl46eiSXeK8AZOwlv9cIdF0ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJbz6V4hAjCNlW8uKyCw/DbN1B9kxSVd8r9t+8pXWMpSCU9jbh
	ORGOru9IDXlUdIPvp+2gt2eCkEMksQuMeE8Su4Cbr3CtUKoEr8bmyJDHzcb/AIfIQoDt+vQKyeE
	bNGXYsLXSBJ524vDlVmXgr1916/c475NbQnm33v7Z
X-Gm-Gg: ATEYQzzMD5aV5GpEW0WKUZii+S9DGDA3IdoTalyeZqNaMuSBK+gNjY+Uu9WhKxDw2jA
	AXWC8j7uubqnJIA95wZyoA5VcxjAP3PGfKjv0B2s9uGqzXFjxlKT5RyMZ3WZ2hipe4ON+33qu5h
	qr7RoORzdKzlK9L4GMtmHHDh6x+jr+uHnuqAIG1RHPh0BTWNifKBTSbi0fTPMf/fCQG1hMQTdJu
	weEIsyOR5lNZqy0SkTdRmXgF0Mz3wbNfXJkiyhUWNSNSCq6UxyQLGUDe0DYGMgZijNTKKP99P2R
	kVw4FHykt+nKUNsRPD+MQyBTFOjaawtyPEce7JAxv4H2YbSqfSD0E4+X5g+Wwc48r/viuprnndu
	LL7OWQg==
X-Received: by 2002:a05:7022:6992:b0:128:ce44:be8f with SMTP id
 a92af1059eb24-128e779f435mr631048c88.2.1773205056860; Tue, 10 Mar 2026
 21:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-unix-proto-update-null-ptr-deref-v3-0-2f0c7410c523@rbox.co>
 <20260306-unix-proto-update-null-ptr-deref-v3-2-2f0c7410c523@rbox.co>
 <CAAVpQUCdzpwbu=fOrwCnaCFuD3U5SL73PB2nroqgUB4QdJ69og@mail.gmail.com>
 <3bf84a79-7335-483c-b629-2437e360387d@rbox.co> <CAAVpQUB8fvyKSQ8UjBs4=FHmz0iME4SO=3CviS_dCzLNTLkjHQ@mail.gmail.com>
In-Reply-To: <CAAVpQUB8fvyKSQ8UjBs4=FHmz0iME4SO=3CviS_dCzLNTLkjHQ@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 10 Mar 2026 21:57:25 -0700
X-Gm-Features: AaiRm50dWB64huQ0DmvsBEvKGoF1e3fB43KjjwJ89Hmeo2RR70RzYJdAJbH7aDE
Message-ID: <CAAVpQUADj21wNH=OkUVxW81Zf8RPd1TxLgcfU1wVbWXDY+W6Sg@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/5] bpf, sockmap: Use sock_map_sk_{acquire,release}()
 where open-coded
To: Michal Luczaj <mhal@rbox.co>
Cc: John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Cong Wang <cong.wang@bytedance.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 9:17=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Fri, Mar 6, 2026 at 6:05=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote=
:
> >
> > On 3/6/26 06:44, Kuniyuki Iwashima wrote:
> > > On Thu, Mar 5, 2026 at 3:32=E2=80=AFPM Michal Luczaj <mhal@rbox.co> w=
rote:
> > >>
> > >> Instead of repeating the same (un)locking pattern, reuse
> > >> sock_map_sk_{acquire,release}(). This centralizes the code and makes=
 it
> > >> easier to adapt sockmap to af_unix-specific locking.
> > >>
> > >> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> > >> ---
> > >>  net/core/sock_map.c | 21 +++++++--------------
> > >>  1 file changed, 7 insertions(+), 14 deletions(-)
> > >>
> > >> diff --git a/net/core/sock_map.c b/net/core/sock_map.c
> > >> index 02a68be3002a..7ba6a7f24ccd 100644
> > >> --- a/net/core/sock_map.c
> > >> +++ b/net/core/sock_map.c
> > >> @@ -353,11 +353,9 @@ static void sock_map_free(struct bpf_map *map)
> > >>                 sk =3D xchg(psk, NULL);
> > >>                 if (sk) {
> > >>                         sock_hold(sk);
> > >> -                       lock_sock(sk);
> > >> -                       rcu_read_lock();
> > >> +                       sock_map_sk_acquire(sk);
> > >>                         sock_map_unref(sk, psk);
> > >> -                       rcu_read_unlock();
> > >> -                       release_sock(sk);
> > >> +                       sock_map_sk_release(sk);
> > >>                         sock_put(sk);
> > >>                 }
> > >>         }
> > >> @@ -1176,11 +1174,9 @@ static void sock_hash_free(struct bpf_map *ma=
p)
> > >>                  */
> > >>                 hlist_for_each_entry_safe(elem, node, &unlink_list, =
node) {
> > >>                         hlist_del(&elem->node);
> > >> -                       lock_sock(elem->sk);
> > >> -                       rcu_read_lock();
> > >> +                       sock_map_sk_acquire(elem->sk);
> > >>                         sock_map_unref(elem->sk, elem);
> > >> -                       rcu_read_unlock();
> > >> -                       release_sock(elem->sk);
> > >> +                       sock_map_sk_release(elem->sk);
> > >>                         sock_put(elem->sk);
> > >>                         sock_hash_free_elem(htab, elem);
> > >>                 }
> > >> @@ -1676,8 +1672,7 @@ void sock_map_close(struct sock *sk, long time=
out)
> > >>         void (*saved_close)(struct sock *sk, long timeout);
> > >>         struct sk_psock *psock;
> > >>
> > >> -       lock_sock(sk);
> > >> -       rcu_read_lock();
> > >> +       sock_map_sk_acquire(sk);
> > >>         psock =3D sk_psock(sk);
> > >>         if (likely(psock)) {
> > >>                 saved_close =3D psock->saved_close;
> > >> @@ -1685,16 +1680,14 @@ void sock_map_close(struct sock *sk, long ti=
meout)
> > >>                 psock =3D sk_psock_get(sk);
> > >>                 if (unlikely(!psock))
> > >>                         goto no_psock;
> > >> -               rcu_read_unlock();
> > >>                 sk_psock_stop(psock);
> > >> -               release_sock(sk);
> > >> +               sock_map_sk_release(sk);
> > >
> > > I think sk_psock_stop() was intentionally put outside
> > > of rcu_read_lock() to not extend the grace period
> > > unnecessarily. e.g. while + __sk_msg_free().
> > >
> > > Maybe add __sock_map_sk_release() without
> > > rcu_read_unlock() ?
> >
> > How about dropping this patch completely? The more I stare at it, I see=
 no
> > reason why af_unix state lock would matter in any of these places.
>
> I agree.  Actually, once it's held, it can be released right away.
> The lock is only to ensure that peer is set after checking
> TCP_ESTABLISHED, but it continues holding unix_state_lock()
> unnecessarily long.
>
> Honestly I prefer Martin's idea, using unix_peer_get() in
> unix_stream_bpf_update_proto().

Pondering again, I'm leaning to towards my initial approach,
just null check for peer, which allows bpf_iter to acquire
unix_state_lock() and make sure the socket is alive.
(still lock_sock() is needed for bpf_setsockopt())

The check is lightweight and SOCKMAP does not need to
hold the lock unnecessarily, and we can provide stable
result to bpf_iter.

IOW, if we hold unix_state_lock() in the SOCKMAP path
(even unix_peer_get()), we cannot use unix_state_lock()
for bpf_iter and lose stability since it will trigger dead lock.
