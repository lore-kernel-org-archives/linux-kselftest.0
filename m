Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9A41D11E
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 18:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756916; cv=pass; b=AXDhJHNtMDVtFLj/+e7MLoGk4LDsjH6Qg/WaqPMYVZDoUWH1nn2VuruhMrDytOPzBvrd7vEEhbUEhztPNHfYCECPrZXbfrNh9hkW5jWFQIZ/C93QjH7CQFHa6CE4SlCYHmpfgvorXJPxfE+ODTwbYDVcOiZ3L7sAvtCV0bgQlh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756916; c=relaxed/simple;
	bh=Q8kkoI9QqrR4BWwHpqPvOzkefuLSVO6IwXVa5vt71T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5zmObfqn2y/8IMYxoMt2rjZT1E+htBNcE8KdoknQIRzTe3zbAKeFKlTlLvMi06sINOwGajjVQOZW6cFprWAbOQKlvH+ROMPMecYkgMMJXZxhHfov8BpNor7UMj50LHVPXC6gxS7UsGXAAb1ztihjm6lbo19IiudRcv6ulwWFJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wGMIcxpd; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wGMIcxpd"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c3304784so922584a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756906; cv=none;
        d=google.com; s=arc-20260327;
        b=H6OJh1o0ciODdceIHGd0E5zEOUlUkw7GEIs9yqEPiDyJlV6MgFqDKhiksEJ+rh7DBf
         adpurx6YUBllY3HDvPsg+LJMX5rXxSD4nSF7IjEQ/Cwuf2hfQfg49ELBTUcGfyEESzZJ
         eR0yu0fpNuXERquvChX86t7+MWGFY3e2PzLHc8qwdclDnQ5xQ//Apgl6S6kzBwTZrG3B
         oI7CtqDq9gdtpvAK8N2Z7kNyiPx2M/+5rs8xOB66gzA7FeOsyz8uLSlvhkzgXO7hsI/I
         5wm9dazFfBJNiD0fTnN0+hUuLX4FpWzF0p1Uo6yCFFy2uC1Vtf/OWxzet4pX2bOnAjzG
         Nkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yigc03ybrtRAGj7IJjhu02MFv33g38bHvAEAEo9T+Ik=;
        fh=5I6NeayJDzq7oUXXoWRKnR6eZ+PuXxUBgRoVjUlemVM=;
        b=Shmm8cr3nPHHainPa26XjfSAddOwCZJzi11Xb6sLGVOwFZBA/mZi1wmMpQyngdN08t
         1z7LDFDXPK4R2Ot+9OnTiq8ryuG+Z9kLmyz7KLOy++fnhJMYMWMoHfqzHts6IQckQHzl
         Rdv0Mn8kg9csUSs+K47U7M7n8UphHQrMhYGsBf36MZ2QHgo8DHHLIYlFzzSCJOIcqFY3
         GwpEyF3FiKrs5PXbWhBcAOhecSMl86lTyZvgj/ZIeBYnasJp/Ck3l2ya+7psKcuImRsA
         tcbLtS3oxHAUVRb2HKGHRsqmx+F/rfqfmwO7UjNCn2O2a/YpfHQ0sSMXmDFXWVQnBvKy
         X0iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789756906; x=1790361706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yigc03ybrtRAGj7IJjhu02MFv33g38bHvAEAEo9T+Ik=;
        b=wGMIcxpdidJ4aKILxjbUVKsjPv5RKo3Gp57VVqbrpQi4KuOm6wJO9snh41BR6AzNv9
         LodJnPl0P0nVPvVk6a6SbrL2kAsOxKlNGdBhfve0q7wNL/NOO0l9N4gMFIXKhLmKxYHn
         Ge2So5XSBT1xDZ0ziNtFCCkgoMqSg/nrBmYBM6Z+wiE4/1zLwOFgQIIZN3XuCnnH86CV
         M7lpLtCwjM2xEOxlc69UcxvA4lTQrUQzQLiLNp/D26vOy582rvj/CR/fTC229hGvk0QS
         elSGRV/XXwa05P3eR9sfGXvpqYvIE11urInSdZBrBbaNJDWIsOW+WWKgXLWE2qd5yn0G
         8zFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756906; x=1790361706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yigc03ybrtRAGj7IJjhu02MFv33g38bHvAEAEo9T+Ik=;
        b=sHDLhzzcdVThx89LB/OCYVxcoXqEaSx11cYFDrq5KSLyjokSp1TR3c6krlqXL5en7H
         TAUkcABc/4reb/RS28IO55NTTLgPLSWpunHE1ycM7Sfb975/wX/kCd82+bX2Ut0lSBT7
         9oHisoQmPVtdCQeDVnFGYwN9/F7OJQW+RYPwEMOpo2LD8qo1GTNSTmWW5LoSAZ2M7i5A
         BXJpYGIcqIjYZeSM6MiznPhBB5gOUx628HNODn9mNWNhVB+PZNRVawcdlFMnur4iiK1q
         ynLW7uVIl2DhvznbSAtMoEwa76iwJj5aYi3aqM9DlhLHtj78kJMCSEvEPjnM2/6L1vEc
         ZsDg==
X-Forwarded-Encrypted: i=1; AKwUvBxiFBweveB6R0UElDkH16KyH6HcYx2ozxPPLjp5lLzR2EnwSNDV0hvdr2eLVdUH3tU/2K9Irn598ga0rsLGa+4=@vger.kernel.org
X-Gm-Message-State: AFuF++nkvW1ip0I92eMbyhEUJ965xtYyC7TSbvEdjYMu+v+QdOgjespW
	lnL9iHszwRvQaZnsT4MouWN5pof7tCeE/qHcurMSbC+uAbHQdAvpZL4bBJFDfe2wkK7Y7F95+ip
	WW3j36gtN2E/S5jiVysNAPAicN55R1U+rwNDwq3J87hl9t5kDU4n9XTtK
X-Gm-Gg: AYBFou0oFqkffs3VhVFgUyTfsCEmHZpNSgOXfuH1FWGB1MlJue1c66D4/NNw+ZOszLG
	mmzoUXCdde2i23dZVvpggWbOzAS0rE1c6RmFbfikdlbWzA7a/oaQjiJvXhfVbg+GEXna8RqusMQ
	+UnP1xFWih1zszAlQkdLszCkarCFe2Ez3HA48ghXYWLCdBrhIFZRZas8/h1lbu33XlOck9j+tMM
	HYnZA3XIIFJSzuZiMWd9K0qTqE2GLCcK9JEL395iGz4Y3AxNMz56pU+4oMFd8dmyH2IAf2qO2Db
	L4dUEvk8+4Ny3vDUOlPh4alVpPzz4/GGMYAHP5laSoOf7gU+Ej+MTGzXTeJGuwEuRp/oa14HCtU
	JS+K+QINnp8v/Ycqb/e6UcGu5S1SYJ6+teuAviz/sR8iPUHN2arlvaz/spuYGyzQmJ0yMTksRK0
	3mP1DDAJurzde+/CDEZq/93R4wFUuKFeri
X-Received: by 2002:a17:90b:1647:b0:39e:4498:4863 with SMTP id
 98e67ed59e1d1-39e54f4187emr10996270a91.10.1789756905720; Fri, 18 Sep 2026
 11:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqyIEE5bRoxRyrFZ@20HS2G4> <20260918042110.2581679-1-kuniyu@google.com>
 <aq2B8PSfjn-xau4V@20HS2G4>
In-Reply-To: <aq2B8PSfjn-xau4V@20HS2G4>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Fri, 18 Sep 2026 11:41:34 -0700
X-Gm-Features: AcwNN1U_wRZ_cMbwfEJmIW3q1Qd9L-P9A846ypz2R_CtNGbxLJdF1kkNVVEz-bY
Message-ID: <CAAVpQUD9NJGR-odxR6om0EWTC++BybAA3uyA8ezip4SJBf-Qpw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/3] net: hash uncached route lists by device
To: Chris Arges <carges@cloudflare.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, idosch@nvidia.com, kernel-team@cloudflare.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:24=E2=80=AFAM Chris Arges <carges@cloudflare.com=
> wrote:
>
> On 2026-09-18 04:19:34, Kuniyuki Iwashima wrote:
> > From: Chris Arges <carges@cloudflare.com>
> > Date: Thu, 17 Sep 2026 19:38:40 -0500
> > > On 2026-09-17 22:10:22, Kuniyuki Iwashima wrote:
> > > > From: Chris J Arges <carges@cloudflare.com>
> > > > Date: Thu, 17 Sep 2026 14:38:21 -0500
> > > > > We have observed hung tasks blocked on rtnl_mutex while network n=
amespaces
> > > > > were being removed. The namespaces contained many network devices=
, and the
> > > > > host had accumulated a large population of entries on the global =
per-CPU
> > > > > uncached route lists. A perf profile collected during one inciden=
t
> > > > > attributed most of the cleanup worker's samples to rt_flush_dev()=
:
> > > > >
> > > > > ```
> > > > > 99.92% kworker/u384:3-  worker_thread
> > > > >   `-88.71% process_one_work
> > > > >       `-81.02% cleanup_net
> > > > >           `-81.00% unregister_netdevice_many_notify
> > > > >               `-79.42% notifier_call_chain
> > > > >                   `-78.05% fib_netdev_event
> > > > >                       `-77.92% rt_flush_dev
> > > > > ```
> > > > >
> > > > > For each device, rt_flush_dev() visits every possible CPU and sca=
ns the
> > > > > global uncached route population while its caller holds rtnl_mute=
x. If N is
> > > > > the number of devices, C the number of possible CPUs, and R the n=
umber of
> > > > > uncached routes, the cost is O(N * (C + R)).
> > > > >
> > > > > During namespace cleanup, other processes that issue RTNETLINK op=
erations
> > > > > requiring the RTNL lock can stall until cleanup releases the lock=
.
> > > > >
> > > > > A minimal reproducer is available here:
> > > > > https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-s=
torm
> > > > >
> > > > > This series replaces each per-CPU uncached route list with a hash=
 table
> > > > > using the network device as its key. Each table uses 64 buckets.
> > > >
> > > > This sounds a bit overkill.  Also, this series still leaves
> > > > O(N * C) loops.
> > > >
> > > > Given unregistering a single device is less common than
> > > > destroying netns, I think the right approach should be to
> > > > make the route flush once in cleanup_net() + outside RTNL.
> > > >
> > > > Could you try this change ? (only compile-tested)
> > > >
> > > Excellent, I'll test this and report back.
> >
> > I found a pre-existing issue, which affects the previous
> > diff, so on top of it, please apply this patch
> >
> >   https://lore.kernel.org/netdev/20260918041439.2575935-1-kuniyu@google=
.com/T/#u
> >
> > and this diff :
> >
> > ---8<---
> > diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> > index d35b66b33bbc..c12e20e07749 100644
> > --- a/net/ipv4/route.c
> > +++ b/net/ipv4/route.c
> > @@ -1567,12 +1567,13 @@ void rt_add_uncached_list(struct rtable *rt)
> >  {
> >       struct uncached_list *ul =3D raw_cpu_ptr(&rt_uncached_list);
> >
> > +     rt->dst.rt_uncached_list =3D ul;
> > +
> >       spin_lock_bh(&ul->lock);
> >
> >       if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> >               rt_replace_uncached_list(rt);
> >       } else {
> > -             rt->dst.rt_uncached_list =3D ul;
> >               list_add_tail(&rt->dst.rt_uncached, &ul->head);
> >       }
> >
> > diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> > index 6cffe8440b44..f22793abbbb8 100644
> > --- a/net/ipv6/route.c
> > +++ b/net/ipv6/route.c
> > @@ -155,12 +155,13 @@ void rt6_uncached_list_add(struct rt6_info *rt)
> >  {
> >       struct uncached_list *ul =3D raw_cpu_ptr(&rt6_uncached_list);
> >
> > +     rt->dst.rt_uncached_list =3D ul;
> > +
> >       spin_lock_bh(&ul->lock);
> >
> >       if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> >               rt6_uncached_list_replace(rt);
> >       } else {
> > -             rt->dst.rt_uncached_list =3D ul;
> >               list_add_tail(&rt->dst.rt_uncached, &ul->head);
> >       }
> >
> > ---8<---
>
> Kuniyuki,
>
> I was able to test this diff, the previous diff you sent plus the fixup
> mentioned above. I was able to confirm even greater reduction in contenti=
on
> as measured by how much latency an unrelated process takes when waiting f=
or
> cleanup_net to complete. This makes sense since we don't even need to hol=
d the
> lock when processing those routing entries with your patch.
>
> Some rough average latency numbers with 36 devices, 160k routes, 8 vCPUs:
> - main: 137ms
> - my hashing proposal: 13ms
> - your patchset: 1.8ms
>
> I'd be happy to retest any proposed patches.

Great, thank you for testing !

I will post patches officially once my fix lands in net-next
(so should be after next Thursday)

Thanks !
