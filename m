Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A9939DBDB
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 21:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337190; cv=pass; b=K/8FT0LHbUFivagQagJ4droInBUS0Ssqdv+jPmb18wLrfwY9liSv31kazZi362rj9J9hAvceBuquGEke0AdtfaIDtn9dA/n4uwejd6oROw+VBD7+C2d5kJJQ9jRWKxapZIfaOThYzMPADhDrBN/EnrP1DVBb7MJBpCjeNHndrNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337190; c=relaxed/simple;
	bh=a0BWoGM5wyNogAPP+XjvyDbv/wr3Fz33yIX41qc+w0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8BefbHTNWOeO1FrR5ns05TENkW8aNIF+Xr3j0vA26OO2PQENOU90Yj9i4oZ75TGOpsBZq67ax/52nTwAxCivdLGgf/79eSxNDrQewRpLOcZoiZfW/uO97EvEOEFQ0BymY9IDGS3T8cEmxEFljY9JVS9wZqml2MXzENRa7eXPfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3LZAylK; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3LZAylK"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-139a71baa35so4017962c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782337188; cv=none;
        d=google.com; s=arc-20240605;
        b=TPh7NffCut7+vs9vjASrJa1/6ROSCd717IxyM3hCHBqNuurdqfe3V8yKhSvyxfPJsZ
         SMPd3Mdka1I29/aHYDLBHDrz0/JtVDfGejcz/oePWn1loAYxXur5s6qsbrXfrhXtXPB9
         j6iNuiAYKQSMK5jE7M9uidEwXca4oBqHbqtSgBwknQfgEpGCSlVdT/mMm7XqExexefai
         ZXwYGik6WymP+eEiDrX5wHa1LjHZqmoB1Tx8fKJxI0iKeXPHKa4txhLF0iz+YJ4dgohj
         SYJjegbuH1eUukyO8ryfZ2I546Lm920s+EKUqgAS0h1RtBykiM4bUx+gf1u6oIYyCPNF
         uPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lNSvwqHXnP6aEtKjspQ712l6vpxfCEvAq9jpKI16xuw=;
        fh=1CDETCm1fXl9WQac4yVzqBnU3miLEW/0HxRnZ6iYZx0=;
        b=LsjiNqlkUPuxSzfhF+M8/umxY17n0cDaP72dfI/pEnexxTYf58CEr80HQMFeLfCXnB
         SIgBHI8kxYytnc87qDWzfYXyyywSw35Zrh2TSNXXFY7lWHvQdg5zW9x8B+rrupHEjEEe
         ujsbedEIVCta/cob35oK4x50ssPNXkEwYzp3HZdLbCyXwBYJMKftJhBnkha5Eys2ta82
         H/G578U849DpcWs7KbRJnjv71iJRqLB7c73bvLTOXx47NoIfClhPLehQkXdWDTPikDHg
         PXJzOzdUnRxpcP3lg/+SX8zra4A86dvlLpVfgFBSbC4atSakSj3+nc5dgJnEna3DYut4
         8RDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782337188; x=1782941988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNSvwqHXnP6aEtKjspQ712l6vpxfCEvAq9jpKI16xuw=;
        b=P3LZAylKob/nuUnYcPQ3YRs7smRwQ+je8crAXtoimBHbhcScPpObB02cV3FTGKF2YG
         Lb7JaoEe0lG+xudeJcMoS4N+7M8dXh9bY2LqtruJ3zLAeTX9D45Z+QXfNXtCZRWSBvGM
         p2RdT2mdkJdQha+1gYXDH1H3HT4ae2Qkg1JJOvK+8ihMpda69j8K4QC68lXwXhEAXSH9
         zsWubaVTdE0BTwhsNAnKygAoz3QNmrF+hnqycon64ooVlUIJzfXzwV2NYXMIBjQKmDjO
         2qDoIFC/oszGf423bolOvJZh7oAl1/8pxobyMhLN5ELjMQVoa1/wF2kAjPAL2OjW3Hiv
         /27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782337188; x=1782941988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNSvwqHXnP6aEtKjspQ712l6vpxfCEvAq9jpKI16xuw=;
        b=SalGIAMOsuXs3RJ1WkvkOTKQcbJJqa+yS/+WU3V4At9WAEYtAxjJuq3laex85vi18l
         SCG9w+zN1enEdTGRCwtBwa10EEm/3jHVK51PNIrIBihM53vxRMvv6ebr8ZaN/7s6/Vtv
         kYRYubfI6pUsL+bxN6pha+M7oZ5FwyJtiQ9A164L59sOS5GDNz5CehtS3EFPbGqeILUU
         egDvgp6IY92rBhL7pVJNZ+PJt9bBDLXhI5ZAPbCaTIReVbk9a42+SNQfKHZ1tIGOWuUU
         LZqKXpV8iu585Owbfqytgc1hr0jtpwnikVysLhtauubjMFdID5lsoPPCK9ldLagA264B
         tIcg==
X-Forwarded-Encrypted: i=1; AFNElJ/LVYxsd+pc39FK47ZRsEvUpPHRuqDMLfwltZ0mRmbIhbiTVSRK4uDCzSz0F3pexKz1cy0xCkAiRE1XP2XCAbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNaOhJouZo9T+3OA3FIp2psYWOtr4BYanecK56Hh2v2dsJOfz
	l+vSjCU873Zv60rE7XT76L+iEDKHtQE/XE3+q4undY55cRFnqmyADaY0lJBJ4dRJN2HSUUB+m6Q
	SN3/IMcLv9VXXQJoOPSpo+8QYFKcnij+AHUfo04qN
X-Gm-Gg: AfdE7cnJHpY+n2oKjb76OFR7Gybc3sJdJ7ovlqdAr5qlzOLbg9qEd1PUZ+7xCxN/9rH
	gjOWIcGMP/imfPpjIoX/Wsa9KrwmmcLeiNQJ15WF36IpRfj9uH/lLUxPr/2P+Tk2asg0epboMbt
	oSt+MEXwwpe0NTyokqY1QEfnPMGSlyYDTxtSSiAaEaPQv3KcyBA5DX5r3Sjt/sShI8sEA47+Mw/
	lO+qBR2K5nseTq6KFPLCS84xYa1siCTjx/LSmQkGa+6xkt0MSFOwOkm4ttH+SGZfT+uc+Oq+v7f
	1zpIvWa087DfEhnH+4Lrf1aag8bEQSfyiDxhaGwLA3NIOqt26QwQwVdLbPtqr4FYeK9UzzLehAT
	AzR5e38wSoHiA59Yr5UKsdiJ6m6Lsde1WmnCTbYg=
X-Received: by 2002:a05:7022:418:b0:12a:b39a:339f with SMTP id
 a92af1059eb24-139d0c8901bmr4402081c88.21.1782337187102; Wed, 24 Jun 2026
 14:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-sockmap-lookup-udp-leak-v1-0-05804f9308e4@rbox.co>
 <20260623-sockmap-lookup-udp-leak-v1-1-05804f9308e4@rbox.co>
 <87wlvoxdq1.fsf@cloudflare.com> <willemdebruijn.kernel.24d11e11d5dc0@gmail.com>
 <dd065bfb-52ce-48fd-b1ef-9c6166f714ed@rbox.co> <CAAVpQUBHMrSiWqn0Zo_D7sUCLFdkKggduoijRdFtHx5CPiSpsg@mail.gmail.com>
In-Reply-To: <CAAVpQUBHMrSiWqn0Zo_D7sUCLFdkKggduoijRdFtHx5CPiSpsg@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 24 Jun 2026 14:39:35 -0700
X-Gm-Features: AVVi8Ccp6GmoDjpIUj-Vaf70dAXiuN1iiE4qx-o6J_Vc31yAsa0rWYIuFIlKCsk
Message-ID: <CAAVpQUAy=EVZcZRmXJPr=neJh7Q+UbYML5L4+nBynVrDPidUkw@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf, sockmap: Don't leak UDP socks on lookup-bind-release
To: Michal Luczaj <mhal@rbox.co>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Cong Wang <cong.wang@bytedance.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 2:33=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> On Wed, Jun 24, 2026 at 2:26=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrot=
e:
> >
> > On 6/24/26 22:01, Willem de Bruijn wrote:
> > > Jakub Sitnicki wrote:
> > >> On Tue, Jun 23, 2026 at 08:03 PM +02, Michal Luczaj wrote:
> > >>> UDP sockets get SOCK_RCU_FREE set when (auto-)bound. This means
> > >>> sk_is_refcounted(unbound) =3D true, while sk_is_refcounted(bound) =
=3D false.
> > >>>
> > >>> Because sockmap accepts unbound UDP sockets, a BPF program can incr=
ement a
> > >>> socket's refcount via lookup. If the socket is subsequently bound, =
the
> > >>> transition from unbound to bound causes bpf_sk_release() to skip th=
e
> > >>> decrement of the refcount, causing a memory leak.
> > >>>
> > >>> unreferenced object 0xffff88810bc2eb40 (size 1984):
> > >>>   comm "test_progs", pid 2451, jiffies 4295320596
> > >>>   hex dump (first 32 bytes):
> > >>>     7f 00 00 01 7f 00 00 01 d2 04 1b b7 04 d2 00 00  ..............=
..
> > >>>     02 00 01 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@..........=
..
> > >>>   backtrace (crc bdee079d):
> > >>>     kmem_cache_alloc_noprof+0x557/0x660
> > >>>     sk_prot_alloc+0x69/0x240
> > >>>     sk_alloc+0x30/0x460
> > >>>     inet_create+0x2ce/0xf80
> > >>>     __sock_create+0x25b/0x5c0
> > >>>     __sys_socket+0x119/0x1d0
> > >>>     __x64_sys_socket+0x72/0xd0
> > >>>     do_syscall_64+0xa1/0x5f0
> > >>>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > >>>
> > >>> Maintain balanced refcounts across sk lookup/release: (re-)set
> > >>> SOCK_RCU_FREE on proto update to treat the socket (whether bound or
> > >>> unbound) as not requiring a refcount increment on (a RCU protected)=
 lookup.
> > >>>
> > >>> Fixes: 0c48eefae712 ("sock_map: Lift socket state restriction for d=
atagram sockets")
> > >>> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> > >>> ---
> > >>> Note: this issue is related to commit 67312adc96b5 ("bpf: reject un=
hashed
> > >>> sockets in bpf_sk_assign").
> > >>> ---
> > >>>  net/ipv4/udp_bpf.c | 3 +++
> > >>>  1 file changed, 3 insertions(+)
> > >>>
> > >>> diff --git a/net/ipv4/udp_bpf.c b/net/ipv4/udp_bpf.c
> > >>> index ad57c4c9eaab..970327b59582 100644
> > >>> --- a/net/ipv4/udp_bpf.c
> > >>> +++ b/net/ipv4/udp_bpf.c
> > >>> @@ -173,6 +173,9 @@ int udp_bpf_update_proto(struct sock *sk, struc=
t sk_psock *psock, bool restore)
> > >>>     if (sk->sk_family =3D=3D AF_INET6)
> > >>>             udp_bpf_check_v6_needs_rebuild(psock->sk_proto);
> > >>>
> > >>> +   /* Treat all sockets as non-refcounted, regardless of binding s=
tate. */
> > >>> +   sock_set_flag(sk, SOCK_RCU_FREE);
> > >>> +
> > >>>     sock_replace_proto(sk, &udp_bpf_prots[family]);
> > >>>     return 0;
> > >>>  }
> > >>
> > >> There is a side effect that an unhashed (unbound) UDP socket can now=
 be
> > >> selected in sk_lookup with bpf_sk_assign.
> > >
> > > The commit does mention a related fix, beneath the ---, commit
> > > 67312adc96b5 ("bpf: reject unhashed sockets in bpf_sk_assign").
> > > That fixes a similar issue by exactly disallowing this:
> > >
> > >     Fix the problem by rejecting unhashed sockets in bpf_sk_assign().
> > >     This matches the behaviour of __inet_lookup_skb which is ultimate=
ly
> > >     the goal of bpf_sk_assign().
> > >
> > > So ..
> > >
> > >> Though perhaps that's for the
> > >> better because TC bpf_sk_assign doesn't reject non-refcounted UDP
> > >> sockets either, so we would have both socket dispatch sites behave t=
he
> > >> same way.
> > >
> > > .. there are two conflicting types of consistency here? Consistent wi=
th
> > > __inet_lookup_skb or the TC bpf hook. Of those the first is the more
> > > canonical.
> > >
> > >> Also, with this patch, if we insert & remove an unhashed UDP socket
> > >> into/from a sockmap, we end up with an unhashed non-refcounted UDP
> > >> socket. Not entirely sure if that is actually a problem or not.
> > >>
> > >> Willem, what is your take on having unhashed non-refcoted UDP socket=
s?
> > >
> > > I don't immediately see a problem, but I'm not an expert on SOCK_RCU_=
FREE.
> >
> > Perhaps it's worth mentioning that unhashed non-refcounted UDP socket i=
s
> > already possible: first auto-bind via connect(AF_INET) (which also sets
> > SOCK_RCU_FREE), then unhash via connect(AF_UNSPEC).
>
> Setting SOCK_RCU_FREE itself should not cause a problem, but I think
> we should take a step back.
>
> AFAIU, 0c48eefae712 was to allow putting AF_UNIX SOCK_DGRAM sockets
> into sockmap, not to allow using unconnected UDP sockets in sk_lookup etc=
.
>
> Actually, v4 of the patch was implemented as such but did not get any fee=
dback,
> https://lore.kernel.org/bpf/20210508220835.53801-9-xiyou.wangcong@gmail.c=
om/#t
>
> ... and v5 (the final commit) somehow removed the restriction for unconne=
cted
> UDP socket as well.
> https://lore.kernel.org/bpf/20210704190252.11866-3-xiyou.wangcong@gmail.c=
om/
>
> Given the initial use case, sockmap redirect, is still blocked by
> TCP_ESTABLISHED
> check in sock_map_redirect_allowed(), I feel there is no point in support=
ing
> unconnected UDP sockets in sockmap.  It cannot get any skb from anywhere
> (without buggy sk_lookup).

s/unconnected/unhashed/g :)
