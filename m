Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793362251;
	b=Os5Dtya7zK0nfhQYPmr5fLNvHeVtQ9aUhVAKiwkfJ/az6W3LVOAWCaOy6Kx3s3YH326c
	 q1Jo0iccsiPStlpQUUk4yFmlCDgMzJ2jjX1O9Z3AfzJRhOZrPKkf2mbj9tbjUOEK8My0u
	 mLBITP/luoOGuGMF8CsrBRNxiEC+WHPvXghZP5oHdJPZ4AUlhjf2K1uA2QrhF2EKGGXO+
	 zVjx4GGc8HXO5GCnJBrZTuxutMt1Ht8EKIJAELQ/XEbYSAQyowC/u97Lfd571Jyi+oLZo
	 TeXUzAth6xwc6WeETV2mYYnMubGGfA4IJ3wlrSMxi62DUBCRKOkLH9ThgpzoktlOeVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QA50g16aHudGDcSXsItQdqb/ZNETm3wfRubXwKNAx98=;
	b=yqTEic5Yi8jOKDvxHl5LYwUFRyfeLeOD2mKjxvY4d5ONoggvDoSJQ4HHRKyy1Ttj+PEB
	 aWs0WfuhmeDa7oBCZKSxcM21TYhGAraQ4B9pMmx6kUniHhyOlY2FXrMSjqwOSQUO82Gds
	 z7LdpW1H2NmvVq/M2vtvFXbCt6IfC0uBT5CV9W+j7BX33hlBJh7E0OGV9oTYPzBV7VjI3
	 2Yudo6LEWJput+wGYx5F9N74YilpuPyO2iphb7vyfp3F27xnI4049CdzwekKS9PStwn3n
	 ja/VYjmEkMuDWHgppFUq6V0z9IUJWSYql4gwl+VQ2sws8kHwM4QxIvgiQSYFnucEgMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3MVxeMT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83C4606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 12:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A83C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3MVxeMT
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-54cd7de2d42so445872b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 05:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793362249; cv=none;
        d=google.com; s=arc-20260327;
        b=Iw1jgSgabf21LUaSEoFdHRVtLYZhWmFKh78jgiQQHNqsYynyURPapvMaXwDGkRgv3X
         nchSMn7sPuqxyqMVf0HMR7itbEBQdXlViFVh9Zw/o8EpUMCAQuNRAEeCxLwkutP/GigG
         ZMs/G+tPIUk4+nV+KkhTLxm9fzXL/jyqjNqG74WMI6fI52VSAtxKJXgjFboMSUPYhMlF
         UEU22tKXPtetlFSR7IuANB7NBTSGNaDZBKqEJPjqxidfUVzjmDFvsalugwwjpQuKsTZU
         k9aE62fpvf7SzguzHF15SgCPZVLDJKd0TG405NeqhtB4F11ygCXDKhWxcnGYnA5Tn3Z4
         Ld/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QA50g16aHudGDcSXsItQdqb/ZNETm3wfRubXwKNAx98=;
        fh=JAKCRH/bpNAqR+R3DhJDgXrrNgs7KgbFFhZdT81FBS4=;
        b=Q5fyk9OZRFfz38mXl58JyDJMf4/IWLgQQ8dzHnBED/yY5tLvRU2rIFKJDaQRRiRwzi
         9gIcKjcpUcUMjKtG1ohqfSpl8Vjuxy4aI0zwc9IYtgAFCy/ly5+qp2izgVCBBQO2P+ve
         vKApVSfB6/6W34VkLFNGYqUqrQLeXWcbc0ozCYDDFQ3cJRQ1lBvE14ca4agPVNO68Huk
         C2ZjXHsLjEJoCCwaJKGMoe6I1svrCu2OK6MVIWxgPXI9Lm+vy5dEy1JIQVCOOfFSlDRB
         e00bBrGVu5wX0gNy08+N+cHsqMDJaLfWqzmBAZLMtbukjIwlkmBCSQibfidV0u1iQ7gB
         RcxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793362249; x=1793967049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QA50g16aHudGDcSXsItQdqb/ZNETm3wfRubXwKNAx98=;
        b=E3MVxeMT8vw/bg1QUyjHbM1ISQlhs/B0OjX5kTo0urxT0gAbzc58k9InBnhmf0Ewq6
         9uQP1EjXZp5Ph/2dBCyX5aryfZuIBJnI4TdnO6iboEASvYrnFeCYMdxOYHS/ZMaTgp73
         66OF6RhEb4JN4nS5RUBjFIQX7yQLn6JSZQjjVw6yNjLHcbcu+DcwMSLDuQm4cMNZ3u4S
         U4iFYjlHgMAf0CI/BXBgKLRuZdFHaZndU8wBpzhviYsdkr/MMywz48GuqWsuP6fy9emD
         H4ZatYNBP8gqNAniHitbn2O8gz0knFr4+WJZ19C2pJJl+nTEfBdy35IlkfowWXVWJpGk
         XNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362249; x=1793967049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QA50g16aHudGDcSXsItQdqb/ZNETm3wfRubXwKNAx98=;
        b=l3DECC/cgnh3HmojKD7fZrhhLIzIq19UoXb0EPnEt2g0hNfVBZW5MHDaqu0YQmwUYo
         xW5sR5i+9B0CZQQ9qp/+drt4XPLQmZ1vRODvSF7lWBiZe2ujxAPTlxsPdvISwpVBCDZR
         vuoT/MVqFsGvRPHBlT9rejqvsLDW9xxyBkheXGrz/f9nTSfEqBxIkpiR8R6A5CrAl8zq
         pcBBT82O6vPfim9M3/UqqwVjwBJFvtKZQLU4o0CGT2KLB72TsJ1SVypQ86BY97F5qKsJ
         tk2lfzcFHsahXGWAjX81YavqLxIL8Y26Sjyi9RrF7F5y2ltaQ5QhjXHJBV3+cHfDr+jT
         yAUw==
X-Forwarded-Encrypted: i=1; AKwUvBxZRDbLFsV3n/Hsy92140ZIjyks9yeRNNDSaq7v1Isni8nFhz008DRiQWR9ylRLSzR7TW0nSgZQjz9J2vuq3dc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo5K8xovSPTrwRde2uzcyWXzpFOcXlJrF7P4degXfFMVu+OFJ0
	NWOTHNH/OGScZkQ1lDBBZ26FSasf2cPZQ9XRbAP0L8KCR4w8XuPT6ISqAfrB5Fqt/P5N95oqFVl
	x6ncuwUKRYBIucpWbs6nEMV/4ErSs2+8=
X-Gm-Gg: AYBFou18a8k5RXWDmr63hhySfugCgRzQKsXT5a9kg4ZSJa9O55heQQYsujBrz4XK6Ao
	nSTzfnxaMa55/q3JwWBZA+4nicK3D59wXfRx/UaNjp7jQz8wpHrgxTXumjFQoN3UI3jV6014cgi
	wsWT+VeAWeGZezv5YEA8Fes72sSjCa660pvn7OYvWiWyVG64lFyPzuejTLxrU4XAGi85hdMlyBq
	rp4SwS5mogx6c1nKZeKhP0t4W8pLPAIAyzGmsq8Gou0Xxt66gV7IBcbquVVltlJ1EsljXt9KCBJ
	AVuVH8jQlQvTQJuWQZJPmZ4xTY4fvpemNObasUZzSDvknPuV2UkUeEniQ3wRoG9TWOl3fY/bwwP
	HvTQhh2/keMOcICKTpJRGvCMqEOG1Ya2MFtEh/rQxAHxpXl9owIp9gXjg9EkYGLa0G5TInN26qU
	yyhNiqr78lnnAvHe1Bzw2zj8g=
X-Received: by 2002:a05:6808:11c7:b0:4ea:686e:fe86 with SMTP id
 5614622812f47-5640df62ac0mr1416797b6e.63.1793362249561; Fri, 30 Oct 2026
 05:10:49 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-netlink-dump-livelock-v2-1-c4bb05352a33@gmail.com> <179332592143.3134.3446883215083774550@kernel.org>
In-Reply-To: <179332592143.3134.3446883215083774550@kernel.org>
From: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Date: Fri, 30 Oct 2026 13:10:37 +0100
X-Gm-Features: AclHuK_RWzDPl0fMVJWfqiGX-48WGTJYsqVpLqwIl0KpdhbtkY637vTEbdwkYGs
Message-ID: <CACgZWq6SQjQDvCz6L_4yo=JG-tB8sdM=1yGWGZA+uaD8CjT=pA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] netlink: check sk_rcvbuf before charging the
 dump skb
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kuniyu@google.com, m.szyprowski@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Oct 2026, Sashiko wrote:
> [High] In netlink_dump() (net/netlink/af_netlink.c:2327), a dump can
> still fail to start because of memory charged by skbs that have...

This is real, but it is not new: both the previous check and the one
before ae8f160e7eb2 refuse the skb when the stale charge alone is at or
above sk_rcvbuf. It needs a single notification with a truesize of at
least sk_rcvbuf, so only very small receive buffers. The patch fixes
the common case where the stale charge is below sk_rcvbuf; the commit
message could have been narrower about that.

Never failing the first skb on rcvbuf would let a reader that does not
read queue one skb per dump request without bound, which is what
ae8f160e7eb2 closed.

> [Medium] This problem wasn't introduced by this patch, but it has the
> same trigger the commit describes.

Right, the gate in netlink_recvmsg() is unchanged by this patch.

Thanks,
Jhonata

Best regards,
Jhonata Poma-Hansen

=F0=9F=87=A9=F0=9F=87=B0 +45 7143 7020 =F0=9F=87=AE=F0=9F=87=B9 +39 3205740=
789




Il giorno ven 30 ott 2026 alle ore 03:05
<netdev-bot+sashiko@kernel.org> ha scritto:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] In netlink_dump() (net/netlink/af_netlink.c:2327), a dump can
>   still fail to start because of memory charged by skbs that have=E2=80=
=A6
> - [Low] The new comment in netlink_dump() ("netlink_recvmsg() continues
>   the dump at or below half of sk_rcvbuf, and the skb must be queued=E2=
=80=A6
> - [Low] The dump_extack selftest (tools/testing/selftests/net/netlink-
>   dumps.c, comment at lines 158-161, branch at 162-163) still describes=
=E2=80=A6
>
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but it has the
>   same trigger the commit describes.
>
> --
>
> netlink: check sk_rcvbuf before charging the dump skb
>
> This patch changes netlink_dump() so that sk_rmem_alloc is compared
> against sk_rcvbuf before the new dump skb is charged instead of after.
> A dump can then start while something else is still charged to the
> socket. It also refuses an skb that would push sk_rmem_alloc past
> INT_MAX, so the wraparound fix from ae8f160e7eb2 still holds.
>
> > diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> > index a904dc3bcad6b..4129e93a9ff0c 100644
> > --- a/net/netlink/af_netlink.c
> > +++ b/net/netlink/af_netlink.c
> > @@ -2318,9 +2318,13 @@ static int netlink_dump(struct sock *sk, bool lo=
ck_taken)
> >       if (!skb)
> >               goto errout_skb;
> >
> > +     /* Check the limit before charging the skb: netlink_recvmsg() con=
tinues
> > +      * the dump at or below half of sk_rcvbuf, and the skb must be qu=
eued
> > +      * then. Keep sk_rmem_alloc at or below INT_MAX.
> > +      */
>
> [Severity: Low]
> Is "the skb must be queued then" guaranteed? netlink_recvmsg() checks its
> gate without any lock that keeps senders out:
>
> netlink_recvmsg() {
>     ...
>         if (READ_ONCE(nlk->cb_running) &&
>             atomic_read(&sk->sk_rmem_alloc) <=3D sk->sk_rcvbuf / 2) {
>                 ret =3D netlink_dump(sk, false);
>     ...
> }
>
> netlink_dump() then takes nl_cb_mutex and calls alloc_skb(GFP_KERNEL).
> Both can sleep before the skb is charged. Several things can happen in
> that window:
>
>   - netlink_broadcast_deliver() fills the socket up to rcvbuf, or puts
>     an skb of any truesize into an empty socket.
>   - A rejected broadcast briefly over-charges before its atomic_sub().
>   - setsockopt(SO_RCVBUF) shrinks rcvbuf.
>   - A second reader's dump skb gets queued first.
>
> Any of these can make rmem - skb->truesize >=3D rcvbuf true after the gat=
e
> passed. netlink_recvmsg() then sets sk_err while the dump keeps running.
> A later read seems to resume the dump, so this looks transient. The same
> races also existed before this patch.
>
> Could the comment and the commit message ("so the skb is then always
> queued") be softened to say this only holds when nothing else charges
> the socket concurrently?
>
> Separately, the plain read of sk->sk_rcvbuf in that gate races with the
> WRITE_ONCE() in sock_setsockopt(). That part is pre-existing.
>
> >       rcvbuf =3D READ_ONCE(sk->sk_rcvbuf);
> >       rmem =3D atomic_add_return(skb->truesize, &sk->sk_rmem_alloc);
> > -     if (rmem !=3D skb->truesize && rmem >=3D rcvbuf) {
> > +     if (rmem - skb->truesize >=3D rcvbuf || rmem > INT_MAX) {
>
> [Severity: High]
> Can the dump still get stuck when the stale charge alone is at least
> sk_rcvbuf?
>
> The commit message says this fixes "A dump that starts while something
> else is still charged to a socket with a small receive buffer fails with
> ENOBUFS and stays running". This check only covers a stale charge that is
> below sk_rcvbuf.
>
> netlink_broadcast_deliver() accepts a notification of any truesize into
> a socket with nothing charged, through rmem =3D=3D skb->truesize. The
> selftest in the next patch uses SO_RCVBUF 2048, which gives sk_rcvbuf
> 4096. With a buffer that small, one rtnetlink or genetlink notification
> can have truesize >=3D sk_rcvbuf.
>
> do_one_broadcast() gives the first listener the original skb through
> p->skb2 =3D skb_get(p->skb). After the reader dequeues it, the charge sta=
ys
> on the socket until netlink_broadcast_filtered() calls consume_skb(skb).
> This is the preempted-sender state from the commit message. The
> broadcaster can also sleep in skb_clone() for later listeners.
>
> The reader then sends a dump request:
>
> __netlink_dump_start()
>     WRITE_ONCE(nlk->cb_running, true);
>     netlink_dump()
>         rmem - skb->truesize >=3D rcvbuf -> -ENOBUFS
>     return ret;   /* cb_running is still true */
>
> The ack goes through netlink_rcv_skb()->netlink_ack()->netlink_unicast()
> ->netlink_attachskb(). There rmem =3D stale + ack truesize, which is abov=
e
> rcvbuf and not equal to the ack truesize, so the ack is dropped.
> netlink_overrun() then sets sk_err, or does nothing if NETLINK_NO_ENOBUFS
> is set.
>
> When the broadcaster later drops its reference, sock_rfree() only
> uncharges. It does not wake the reader or call netlink_dump().
>
> netlink_recvmsg() resumes a dump only after skb_recv_datagram() returns
> an skb, and the queue is empty. So:
>
>   - the next recvmsg() returns sk_err;
>   - the one after that blocks;
>   - every later dump request gets -EBUSY from __netlink_dump_start(),
>     until some unrelated message arrives.
>
> Would it be more robust to never fail the first netlink_dump() call from
> __netlink_dump_start() because of rcvbuf? Another option is to clear
> cb_running, or arrange a resume, when that call fails.
>
> [Severity: Low]
> This isn't a bug, but the dump_extack test in
> tools/testing/selftests/net/netlink-dumps.c still describes the old
> behaviour:
>
> dump_extack() {
>     ...
>                 /* Once we fill the buffer we'll see one ENOBUFS followed
>                  * by a number of EBUSYs. Then the last recv() will final=
ly
>                  * trigger and complete the dump.
>                  */
>                 if (ret =3D=3D FOUND_ERR && (ea.err =3D=3D ENOBUFS || ea.=
err =3D=3D EBUSY))
>                         continue;
>     ...
> }
>
> With this check, the bad RTM_GETNEIGH dumps keep queueing DONE+extack
> skbs as long as the charge before each one is below sk_rcvbuf. So
> sk_rmem_alloc ends up in [rcvbuf, rcvbuf + truesize).
>
> The ENOBUFS ack for the next dump is then refused in netlink_attachskb(),
> and netlink_overrun() sets NETLINK_S_CONGESTED. Because of that bit, the
> later EBUSY acks are dropped as well. The ENOBUFS/EBUSY branch above can
> no longer be reached.
>
> Should the comment and the branch be updated, perhaps to check the new
> behaviour instead? The next patch in the series only adds a new test and
> leaves dump_extack unchanged.
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but the same trigger can also
> stall a dump after it has started. netlink_recvmsg() is the only place
> that continues a running dump:
>
> netlink_recvmsg() {
>     ...
>         skb_free_datagram(sk, skb);
>
>         if (READ_ONCE(nlk->cb_running) &&
>             atomic_read(&sk->sk_rmem_alloc) <=3D sk->sk_rcvbuf / 2) {
>                 ret =3D netlink_dump(sk, false);
>     ...
> }
>
> The sk_rmem_alloc value read there still includes the charge of a
> notification that was dequeued but is held through skb_get() in
> do_one_broadcast(). That charge stays until consume_skb(skb) in
> netlink_broadcast_filtered().
>
> Suppose that notification's truesize is between rcvbuf/2 and rcvbuf:
>
>   1. The dump starts normally under the new check.
>   2. The reader consumes the first dump skb.
>   3. The gate sees the stale charge above rcvbuf/2 and does not
>      continue the dump.
>   4. The next recvmsg() blocks on an empty queue.
>   5. netlink_skb_destructor()->sock_rfree() later uncharges, but neither
>      wakes the reader nor calls netlink_dump().
>
> A dump that needs several skbs, such as a scan dump, then stalls until
> some unrelated message arrives. Could this be handled together with the
> start-of-dump case? The gate and the destructor are not changed here, and
> they behaved the same way before ae8f160e7eb2.
>
> >               atomic_sub(skb->truesize, &sk->sk_rmem_alloc);
> >               goto errout_skb;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261027-netlink-dump-livelock-v2-0-c4bb05352a33%40gmail.com
