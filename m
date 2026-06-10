Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E672459FE
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056706; cv=pass; b=d26Dbos5Z9TG/aOaRIZzpJ07lgdDBcpskpZsCVlNIs+Md4nefG6VZ9e3CC8KBKnT46fnoVuGzYfmeB8sh25/9CKGDwciUwaW/1ZMWPkf63XelztM0z9e+zgVYIB2pHkaKrxBdt3VDpb93HhlWTFCHtQbT/pNVlkX9Tdv1FyT/GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056706; c=relaxed/simple;
	bh=r7wZRIULkzfdJ6PbIVDPQrynqxU84BnGc6ZnGMKQxbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdQGQVF0kOhj4Zr3hWq9XF4gmhPGCDFvtT3TE+ncT5P8hAD5BrYxvT/wFwJRNHYt5gkmSz7xo28sUpaAV46ilV/YpK8rUiRIoE13XofaIO2WLcvJDR6cQ4afHPZnvD5W48M9F9wxZjDJuFelk+G6K47eVTXmkJUCW3UhjKNJS/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHt6vqUW; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHt6vqUW"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6611689dc10so3670226d50.1
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 18:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781056704; cv=none;
        d=google.com; s=arc-20240605;
        b=MJOWBwWPcFDDHiVgRkTVtAqWBixfpS5Nn8aqGLkcQ7bNUroZbqBY0QmQU1uowcsYWp
         1KJKPK6g5wopCHlouwh4pIKywqZX07T6Gw9A5abtJqzYm3SIUCi265VXxFL77TMMdnrd
         lrxXVgtabFjbjHfKnVa1WRo9i/lJTsxLcIGjJp0Blt+FMbK0Yg48OLjW1IsC2gGlOxj6
         JxS3myOV3Snwo6cxVKMFYGm9d704N7jE5d9Aw9uGtQqtdAnB2baMz75+q/BTlFT7TM1m
         Wp1HFsqEZ/aKL42g0XYZaGGi4IGuGIrMw8p88bb6Ef38z3OVAviqxoIaN6gnKg68J/TZ
         ZOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V26tMOgLqjN+F+t/D87zLfcdZGcgB0R+hwG90xbmU9k=;
        fh=KaZLwkMva07RHv8PiprdiHW0kK2aDBed2xEWpUSAIcs=;
        b=V4ARHRzSxVP8+o6tZGE2Vecz8isJtXmD6FjFaPmNpZKn+NnFJcH0WvuX7DAuiHS5mm
         i7BypAp39affdRvCh1onPt2F+EkT3ZuU+o4t8WneZ2IMCuTYPzt4LvSUJTcY0JRebeKL
         PS08eZ+Ow2eCNVGAguiU0pWofHjbFOrqhScuqfYQuL074G8+fcx4jJ7COUk4DUjbjlB2
         XmXD76YMKdMSaCVsWr0pMvlrhRPinFkhqCK1Jy+/8Q9pVRP2gWgQ/OAv8q2NzvZE9HqI
         NKJy2AyUlb5CB9Sb5zcsUHniCfXV7l6wkWNEcIkCnoHG1AmeFHhpZlLGyFCB2Ak6ic8d
         9RWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781056704; x=1781661504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V26tMOgLqjN+F+t/D87zLfcdZGcgB0R+hwG90xbmU9k=;
        b=IHt6vqUWTuoZQ6HfufaMFIuLw052EaXdX8WR6Bn8l0Zcj9CUfBNVtlj+y+OblMvU3+
         R5cMN5n+jW6V7I2+Aq58v39Y14o4e2l6YXq0p2HQ0qLH6fWJpxqfLckfIqsJBADapRTn
         iJzHgEt7YXq+OuSufbQFiP9UYS0h8HGrNwj5VF/FPKx3Tba6il9QnQzDeCJO2gYmrWml
         C2SWNZpiErUUpSBs1SWocJdfNrgO9RyKA0mQ7MS65XahO6PcZiUQD2QubNxnQoyw1lWK
         YzUD2bG2KVd+ACm5Zai4385tTx5/yPGWsWIrhTHfFxS0HJHKZA6b1rY0Tl0dHWZSy/7c
         vC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781056704; x=1781661504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V26tMOgLqjN+F+t/D87zLfcdZGcgB0R+hwG90xbmU9k=;
        b=pio3YGy2gauGJwNEcnLC5TasgwzzsdtHXpxCrizmt4RBhtAHg1blU+tEb4ISz3auOC
         BtTuoGyTb20D9HGfatxkl+mDgXop/+P2XZY1h5Iyu/F8eqyQP8y2wRadA0qTqw1CckFX
         OtJqSlmnvrej80qiyRPk9ATiVWLaExdI4qS3wAXM5UFgcijYAX1tngPeKLJwlFltA34G
         bL6l7PslW581Jh1nHvaRgcl9bgao1ZhhJ5SBfAz91XCDABs8ojxaFq1x/UGXZ5QiHpdQ
         sAS+NMi3EiwItb5nAb+zGjGEqTy4aOkXmTxo7wQEkG/Hlhk1O4hh0JHniISFo/ZKP5H4
         5seQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AaVQhFsqhM7K5MOZLLlZ9Av0gmNdbCkPjRobMsP4DTF/gp237gSm3ILCO9OMj7otd6RyOLXr2FLTaEUl0I28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIIGDGQtYue7BcYe0oCKftdHgB2UmaxXUCuzrooHEbRNzEqsHw
	tQx24hu3zAm86JPgAOJcopWhSsbKzRWfEOjEjMFAXG0J6VEeiLEXNXzNVZSRbjMqe19nXfYYPSH
	z4Al0r5CLhPAYbPA/w87rVzzwNVcYIVo=
X-Gm-Gg: Acq92OFPk9MBWqytPHJakTO0rGjZLwgcUq2eNtp/VUUXYsMWdmi7JvKAOwbAiTYLJE0
	bFIMAwDT7rfhRNTiklVyB7F4FMoWTKGQaFJC4cdcG6OQApywjqMzxi9m1IZQ+BPxH4Sb4LSbey8
	I5cloPEk5HB/0dBWU4p/xk/hlARHnzVXaUOsLihSw19eBf2XOrtLdZHZXqidkqSDVvhjPPM3UWx
	c8Yko+zm4Hc6U8AnCpXa0e32ZBzEfUB0W4dcWaUN8eJQJ3ieNHXUxEpV4MQKvLBHScYoVnc4rGG
	ZcdK8bs6nVDbCBq009/Yn6aRP6FTuETzDco5mIh/xSTmzv8RIURHw8439T/A/qFnO+7Ph6QU
X-Received: by 2002:a05:690e:4390:b0:660:4369:8cb1 with SMTP id
 956f58d0204a3-66106e90b5cmr15646241d50.24.1781056704624; Tue, 09 Jun 2026
 18:58:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609100214.337538-1-sun.jian.kdev@gmail.com>
 <L0cwr1-KRSKR7-dJdjDmJA@linux.dev> <DJ4XIOT2RVMT.28I5LA2UOZVUI@etsalapatis.com>
 <AgOg1pJHQN-gpKhYUz3SMw@linux.dev>
In-Reply-To: <AgOg1pJHQN-gpKhYUz3SMw@linux.dev>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 10 Jun 2026 09:58:13 +0800
X-Gm-Features: AVVi8Cd2Bbe0wde5qToQ7hXErFi3TvnK9_5Ol1Mi8_YsK_saSVysuCpjLW1uQ1Y
Message-ID: <CABFUUZH9F+tiitstSBy2-M=WC84jg28CVMXU+Lu-va6jm71fDw@mail.gmail.com>
Subject: Re: [PATCH] bpf: Unshare cloned skb before devmap egress XDP program
To: Menglong Dong <menglong.dong@linux.dev>
Cc: Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, shuah@kernel.org, 
	liuhangbin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 9:21=E2=80=AFAM Menglong Dong <menglong.dong@linux.=
dev> wrote:
>
> On 2026/6/10 08:06 Emil Tsalapatis <emil@etsalapatis.com> write:
> > On Tue Jun 9, 2026 at 7:06 AM EDT, Menglong Dong wrote:
> > > On 2026/6/9 18:02 Sun Jian <sun.jian.kdev@gmail.com> write:
> > >> dev_map_redirect_clone() uses skb_clone() when redirecting a generic=
 XDP
> > >> skb to multiple devmap destinations. The cloned skb can share packet=
 data
> > >> with other clones.
> > >>
> > >> If the destination devmap entry has an egress XDP program, that prog=
ram
> > >> can modify packet data. Such modifications can then be observed by o=
ther
> > >> clones sharing the same packet data.
> > >>
> > >> This can be reproduced by strengthening xdp_veth_egress to configure=
 a
> > >> different source MAC for each egress device and checking that store_=
mac_1/2
> > >> observe the MAC configured for their own egress devices. Without the=
 fix,
> > >> the SKB_MODE subtest observes store_mac_1 receiving the MAC configur=
ed for
> > >> the next egress device.
> > >>
> > >> Fix this by unsharing the cloned skb before running the devmap egres=
s XDP
> > >> program. Limit the extra copy to destinations with an attached egres=
s
> > >> program.
> > >
> > > Hi, Jian.
> > >
> > > This sounds like a good idea in this case. When I have a look at bpf_=
clone_redirect(),
> > > I found that it use skb_clone() too, which means it has the same prob=
lem. The
> > > data can be modified by other xdp prog in the destination NIC if we u=
se
> > > bpf_clone_redirect().
> > >
> > > So maybe this is the default logic, and I'm not sure if this patch ca=
n break the
> > > existing users :/
> >
> > I think for use cases where we are using bpf_clone_redirect() to use
> > one clone for inspection this would add an unnecessary copy. Maybe
> > adding *_copy() variants instead of changing the *_clone() would be
> > better? That way we wouldn't be changing the behavior for existing
> > consumers and the naming would be consistent with the skb_* methods.
>
> Agree. It's not a good idea to change the logic of the existing API. Or
> maybe we can add a BPF_F_CLONE flag for the existing API.
>
> >
> > But more importantly, is there an actual use case for the kind of API
> > that the modified selftest requires? Nobody until now has considered
> > the existing behavior to be a problem.
>
> Agree too. Obviously, this is not a bug. For the use case in the commit
> log, it's something that can be fixed by the user themself. If we need
> modify the MAC, we'd better attach a BPF program for all the egress
> device in the devmap.
>
> >
> > >
> > > Thanks!
> > > Menglong Dong
> > >
> > >>
> > >> Tested with:
> > >>   ./test_progs -t xdp_veth_egress
> > >>   ./test_progs -t xdp_veth
> > >>   ./test_progs -t xdp
> > > [...]
> > >>
> > >>  destroy_xdp_redirect_map:
> > >> --
> > >> 2.43.0
> > >>
> > >>
> > >>
> >
>
>
>
>

Thanks for all the comments.

I agree this should not be treated as a generic skb_clone() issue, and I
understand the concern about changing existing clone/shared-data semantics.

The case I was trying to address is narrower: generic XDP devmap
broadcast/multi redirect with per-devmap-entry egress programs. The use cas=
e is
not newly introduced by this patch. The existing xdp_veth_egress test alrea=
dy
attaches xdp_devmap_prog to all egress devmap entries, and that program rew=
rites
eth->h_source based on ctx->egress_ifindex. My change only strengthens the =
test
from checking that the observed MAC is not equal to a single magic MAC to
checking that each destination observes the MAC selected for its own egress
ifindex.

So attaching an egress program to all devmap entries is already what this t=
est
does. The SKB_MODE failure happens because the cloned skbs can still share =
the
packet data, and a later per-egress rewrite can be observed by another
destination.

That said, I see the concern that this may need a clearer semantic boundary
between clone and copy behavior. I will also check the last_dst path pointe=
d out
by Sashiko before deciding whether this should be handled as a bug fix, or
whether it needs a separate explicit copy/isolated redirect semantic instea=
d.
