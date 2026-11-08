Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794108633;
	b=KeDuqBv9FzmF3D3Ficck5YjMB7LZYGUQuxxdtNNTaE4UJD8hOxySzXnDMeomgdUYI33f
	 Fkv9SxRIYFH3JVjyoGUWJQOGlrTacDIwVnt7fNjFXTxJTasAP8cIbZ9ZlPj/dM9vLrz7T
	 tDJs00PZCl4/GJOmD6UaDnotACH70Jg4vb7joA0i810XYmT0A22L1bMrALJogZsyU9hFQ
	 0bP21eJ5DsREVh2mYSSr4KDTNPJ+6ShYCfqKbbyoUwhoFRsS6vEisoLOPFeMTAJJDWaJc
	 xioePTbxnnycCry1AUqbIuaKdJ41F0Lgi6BEf5v5n0LISRwh5jyz7vhBq/FlITko3KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794108633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
	b=2rrbb4xcUXrwZXIAn8Ioeq5BAWCZNgQiT21LHM1kHLQRrk5kAg31Mu1duclt1gCQrbfJ
	 oAbW2yd7fDv31aQfbdOZgg8EQgWtL4gf0Pv9LcgrwLB8gI05NtUVpniRZASi/iLPT65xW
	 qmApUa2qysgvYAarmEUnpuKvQd8vd1rnoF0YqhHYsdEbFhG5uBa4xM1HljL8n2rRGd7xQ
	 xq34hqnWbR6kn6dbbERTSexjq13Sf+G0/xei5tv5LJBdV8iyC9lPbN8cSvk3r4jo85vg7
	 muI2KjxO+jOS0faIKk31chwp1pLoGVFVnC7kZAhdkIQfWN6dDN+coF0P8qJjpVWyYkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nAlL2bfY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7D606A31A
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 03:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD7D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nAlL2bfY
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so370680eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 19:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794108632; cv=none;
        d=google.com; s=arc-20260327;
        b=hoBFDIYW0X8CbbSbfIKK2MdgFPJq2YJceDNBQ710Y6iDgaS0Vf+jO8CJzPFFtb+COP
         reDcJepYi1xjftrQbc6t2qALboi9Y8++wFUzluuUrIvoJCLCRuQ9/vP8wRyKJ8gy5DJD
         x8suwX6m67rIpoM5QEb+ZfE8l8Ke+M9Jy3CPIBAziKEeqgQ6Q9RhijT9je8MlhVRcMON
         fL4lyE/elmnS3XcEfuf9LPUDgRx7PgmTNNK5tym2gFaj3GM04Uf1SBkp5Jk2ydFYgefM
         nWHwuGlIkA9+0MDWuR4KJLqrUYSOiluaEJwfZNTJIidCxHyNZ2jwgH8Q8L+M2JIo128q
         lNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
        fh=VgvRcIMmQ8LhqjmPPsvf5Ab8LiiTxFXxd5NvKupCgzA=;
        b=OKr2WUdJPZ2gylSRoeHC8wTvhfU1pqYdRKhOaT7VptvbJBu5otDEOPUNDiYy9OaAwy
         ZzUUWmt5+Co5ORCM2WFkK/mCD72IGsQJ2UqZWLQpBU+IhLiHhUM17V2a3xx53fY9duGw
         96mWE0YsOQOvnRWVfa9UeRgcWGjiVZTsxN2Q+ustltvqWtjn/gDcMNdYR3Kwa4gdc+UC
         1WJTk350mm7h7NFFRMf96r+qitPCVN9We58JrHg4A48vvRkxXxgRtUrmgXKtDmRzdd0C
         eby7F3wWdu5Y+o2cZbgX4fJO7O6zXIWI7JPepGlvTvFgk3+uyGlqJabo4ht/I/v0OhcQ
         HHTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794108632; x=1794713432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
        b=nAlL2bfYDAEluRcAyIHtC6RZ3qcQD5QKgPxNdcXsO3nxsuhsf24HiDAPFHlxhv+Y4P
         nrgQe/7fYOx3Jk8iMljaI7k1Do4os+tx0bC3o7ZPgfZ77aUqb+jyu0KYWD9PdJVbiQCC
         uOqfGjjEok0nJBwZFEdJTKbUJBEuoLdcgNHtrOmmHLWkWUD7kLrYFKkNk3muwoMmdOnb
         V2q+MOk+rqNJc2fTSs84npH5TRyPjkv+zJcHFLuAfPkUsgSndENAuo/qOthOsgSo4NT0
         jivvapsNTX3d6k9nKrqzePqwcgIQlpq15i1UpoiNW60orBc468S/Wpi1V5AjSFoFqI/d
         Q5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794108632; x=1794713432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
        b=F/2Pj2UHPI2tuLMCSccb74Dk3srsTktRjEAbNQKisYZqxU0TgdDG6ZlqoqPXkrLxow
         ONTwwIBkNQuCSjbuaYmKsFtoFF6vJ7Zt4Yyy5HMlSahZ+DPX60pBwr9UzIKNLKkr8Ovw
         UBICYhSh1gLkqFPK/Z+4imiWhf3Q6mlJMdvYObIrQ3HTkcoSH96Sqax0tIsvTZTGJZ3h
         ILD6niZmf4REsCrxWakIx4KxIagXAEoNVXYFpcRHMtS9o3KLquXmUjPGQv5D+cv+5/kr
         9EaI994nldSayWoSEzK5DoAyIKsqpxYveK0r7QdxPnVXSoUF4IUKOHuj0LrBXD4ZOjs2
         Ntog==
X-Forwarded-Encrypted: i=1; AKwUvBywAex8JlwX2lWstkzn6s+d3+TEcj96Z9UdZkYMSbcqT33cbDgQkGmwQj7jwe8lBTxI1FUsqhjdFAHxW2fNbno=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zzlld7JnOLa9+iiwkb+Qs/bmA+7AandJxi89ktU+fhrzJpLFA
	P04axABnXKvzN208cTwK8liZWQLlghSvnZZIIJhekKOYpSsDd8tBl5fcIOSDzwd1oumuGXj4ggS
	ul8PZGZjhOT5VhGe49blQEFLo6y9MdUz4woUp2sCy
X-Gm-Gg: AYBFou15I5lE2TGbe06zB14F8hGY0npyZ6e002ngdkTcR6xlsVQyThfsHdgbzHETgd5
	pn4DtoO9lWUXQUOshbM3kdTe7unMSbCl1JNphPtqcu7TJUYglHEZeNartBh5KYr/OD1Gz5YGv5I
	9jnrp0fwKTRYkxxmPled4myt47wEolb6UeuxO1rhVbCv9wUHaeztSkHJ+YSsnCcTqAk4Nr2RrlL
	rGOP125oXAVEc+yhAP6eVkD0tJ5lGTmq4w2iExPA/AjAQPCxWZLLeyu5FxHjS3cyKyJcAPrkJdC
	3ZL7hXkpp1aTLAINhQoUUBppJkGIGS1jG510eg/M/BiEXejzghwYo8anyXURtSZcZaJK/2Rti5J
	HMRjicv1NKSGT+Bec8ahKVa2RUfVmwAnnVOIljDDATI1mhh1Ex62l9RFlcUTD2j9CFXNp8vmyM7
	kMGJYWL8Loodii+OVtAE+pwZNSdPdssrDe2Qc0ILEHnWfm3q2p
X-Received: by 2002:a05:701b:4656:b0:143:72b1:9004 with SMTP id
 a92af1059eb24-1b39fed7258mr555855c88.45.1794108631163; Sat, 07 Nov 2026
 19:30:31 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
 <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com> <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
 <au9zxblIQx7OF_gx@google.com> <CADVnQy=6mDzR6XQxnasHECbq7=9f54AH8cjny+rAdR_yR_ZsTw@mail.gmail.com>
In-Reply-To: <CADVnQy=6mDzR6XQxnasHECbq7=9f54AH8cjny+rAdR_yR_ZsTw@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 7 Nov 2026 19:30:18 -0800
X-Gm-Features: AclHuK97DApQUstQq_mpiJS3jdsjD0INaaKFdWOXySIkTv--_c4SWQEd8Tu2IKM
Message-ID: <CAAVpQUBc2=6SNDpjXuvR-FPiTWzTYMCZu65-6MXF-3pw60WEaA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
To: Neal Cardwell <ncardwell@google.com>
Cc: echoowall@gmail.com, horms@kernel.org, edumazet@kernel.org, 
	kuba@kernel.org, shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 7:17=E2=80=AFPM Neal Cardwell <ncardwell@google.com>=
 wrote:
>
> On Sat, Nov 7, 2026 at 2:15=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.c=
om> wrote:
> >
> > On Sat, 07 Nov 2026 12:53:36 -0500, Neal Cardwell wrote:
> > > On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
> > > <devnull+echoowall.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Yongjian Wang <echoowall@gmail.com>
> > > >
> > > > tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss=
()
> > > > before MTU probing is enabled, and tcp_init_transfer() enables it l=
ater
> > > > without syncing the MSS again.
> > > >
> > > > With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore s=
tarts
> > > > at the full MSS instead of tcp_base_mss as documented, while an act=
ive
> > > > connection starts at tcp_base_mss. This has two visible effects, sh=
own
> > > > here with tcp_base_mss=3D1024:
> > > >
> > > >  - The MSS drops when the first probe is acknowledged, from 1460 to=
 1242,
> > > >    although that probe has just shown the path can carry more.
> > > >
> > > >  - On a black hole path the MSS never tries tcp_base_mss. It goes f=
rom
> > > >    1460 straight to 512, since MTU probing is already enabled when =
black
> > > >    hole detection triggers.
> > > >
> > > > Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only appli=
es
> > > > search_low when MTU probing is enabled, so the other tcp_mtu_probin=
g
> > > > values keep their behaviour.
> > > >
> > > > The Fixes commit kept tcp_mtup_init() in a single place on purpose,=
 so
> > > > sync the MSS next to it instead of moving it back into the
> > > > syn_recv_sock() handlers.
> > > >
> > > > Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init(=
)")
> > > > Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> > > > ---
> > > >  net/ipv4/tcp_input.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > > index e1f2d9765..c13f005b2 100644
> > > > --- a/net/ipv4/tcp_input.c
> > > > +++ b/net/ipv4/tcp_input.c
> > > > @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int b=
pf_op, struct sk_buff *skb)
> > > >         struct tcp_sock *tp =3D tcp_sk(sk);
> > > >
> > > >         tcp_mtup_init(sk);
> > > > +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
> > > >         icsk->icsk_af_ops->rebuild_header(sk);
> > > >         tcp_init_metrics(sk);
> > > >
> > > >
> > > > --
> > >
> > > Functionally this seems correct. But I'm wondering about the
> > > performance impact, and whether there is a way to achieve this withou=
t
> > > adding this call to the code path for every connection establishment?
> > >
> > > Eric and Kuniyuki, WDYT?
> >
> > Looking at history, initially it seems we properly called
> > tcp_mtup_init() right before tcp_sync_mss() in ->syn_recv_sock(),
> > but 4d83e1773031 removed them.
> >
> > The dup tcp_mtup_init() mentioned in the commit is the one in
> > tcp_init_transfer() today.
> >
> > Then, 27204aaa9dc6 moved only tcp_mtup_init() to tcp_init_transfer()
> > without tcp_sync_mss().
> >
> > The dup exists in tcp_rcv_state_process() from day 0 (5d424d5a674f),
> > and 168a8f58059a copy-and-pasted the unnecessary tcp_mtup_init().
> >
> > So, 4d83e1773031 removed the correct one.
> >
> > Instead of restoring the 2nd set of calls, I think we should
> > revert 4d83e1773031 and remove tcp_mtup_init() in tcp_init_transfer().
> >
> > ---8<---
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index e1f2d9765f81..8d009c0d9359 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -6759,7 +6759,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_o=
p, struct sk_buff *skb)
> >         struct inet_connection_sock *icsk =3D inet_csk(sk);
> >         struct tcp_sock *tp =3D tcp_sk(sk);
> >
> > -       tcp_mtup_init(sk);
> >         icsk->icsk_af_ops->rebuild_header(sk);
> >         tcp_init_metrics(sk);
> >
> > diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> > index a7f9242f1e42..579a88472abf 100644
> > --- a/net/ipv4/tcp_ipv4.c
> > +++ b/net/ipv4/tcp_ipv4.c
> > @@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct so=
ck *sk, struct sk_buff *skb,
> >
> >         tcp_ca_openreq_child(newsk, dst);
> >
> > +       tcp_mtup_init(newsk);
> >         tcp_sync_mss(newsk, dst4_mtu(dst));
> >         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst)=
);
> >
> > diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> > index e006a30360ea..c465fd97baec 100644
> > --- a/net/ipv6/tcp_ipv6.c
> > +++ b/net/ipv6/tcp_ipv6.c
> > @@ -1489,6 +1489,7 @@ static struct sock *tcp_v6_syn_recv_sock(const st=
ruct sock *sk, struct sk_buff *
> >
> >         tcp_ca_openreq_child(newsk, dst);
> >
> > +       tcp_mtup_init(newsk);
> >         tcp_sync_mss(newsk, dst6_mtu(dst));
> >         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst)=
);
> >
> > ---8<---
>
> Thanks, Kuniyuki. I agree that seems like a good approach. Though
> since 27204aaa9dc6 also moved the tcp_mtup_init() out of
> tcp_rcv_synsent_state_process(), I think with your nice approach we'd
> also want to place a call to tcp_mtup_init(sk) right before the
> tcp_sync_mss() call on the active connect code path as well, something
> like:
>
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -7015,6 +7015,7 @@ static int tcp_rcv_synsent_state_process(struct
> sock *sk, struct sk_buff *skb,
>                   tp->tcp_header_len =3D sizeof(struct tcphdr);
>           }
>
> +        tcp_mtup_init(sk);
>           tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
>           tcp_initialize_rcv_mss(sk);
>
> WDYT?

Ah exactly, thanks for catching :)
